import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterdex/pokemon.dart';
import 'package:flutterdex/pokemon_detail.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var url = "https://raw.githubusercontent.com/Biuni/"
      "PokemonGO-Pokedex/master/pokedex.json";

  PokeHub pokeHub;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodeJson = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(decodeJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterDex"),
        backgroundColor: Colors.cyan,
      ),
      body: pokeHub == null
          ? Center(child: CircularProgressIndicator())
          : GridView.count(
              crossAxisCount: 2,
              children: pokeHub.pokemon
                  .map((poke) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            List<Pokemon> evolutions = poke.nextEvolution != null
                                ? poke.nextEvolution
                                    .map((e) => pokeHub.pokemon.elementAt(int.parse(e.num) - 1))
                                    .toList()
                                : [];
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PokeDetail(pokemon: poke, pokeEvolutions: evolutions)));
                          },
                          child: Hero(
                            tag: poke.img,
                            child: Card(
                              elevation: 3.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    height: 100.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(image: NetworkImage(poke.img))),
                                  ),
                                  Text(poke.name,
                                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: Icon(Icons.refresh), backgroundColor: Colors.cyan),
    );
  }
}
