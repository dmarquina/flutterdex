import 'package:flutter/material.dart';
import 'package:flutterdex/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  bodyWidget(BuildContext context) => Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.10,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                  ),
                  Text(pokemon.name, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                  Text("Altura: ${pokemon.height}"),
                  Text("Peso: ${pokemon.weight}"),
                  Text("Tipos", style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type == null
                        ? <Widget>[
                            Text(
                              "No tiene tipo",
                              style: TextStyle(color: Colors.grey),
                            )
                          ]
                        : pokemon.type
                            .map((type) => FilterChip(
                                backgroundColor: Colors.amber,
                                label: Text(type),
                                onSelected: (b) {}))
                            .toList(),
                  ),
                  Text("Debilidades", style: TextStyle(fontWeight: FontWeight.bold)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: pokemon.weaknesses == null
                            ? <Widget>[
                                Text(
                                  "No tiene debilidades",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ]
                            : pokemon.weaknesses
                                .map((weakness) => FilterChip(
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                        borderSide: BorderSide(width: 3.0, color: Colors.white)),
                                    backgroundColor: Colors.red,
                                    label: Text(
                                      weakness,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onSelected: (b) {}))
                                .toList()),
                  ),
                  Text("Evolución", style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution == null
                        ? <Widget>[
                            Text(
                              "No cuenta con evolución",
                              style: TextStyle(color: Colors.grey),
                            )
                          ]
                        : pokemon.nextEvolution
                            .map((evolution) => FilterChip(
                                backgroundColor: Colors.green,
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                                onSelected: (b) {}))
                            .toList(),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(pokemon.img))),
              ),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(pokemon.name),
        backgroundColor: Colors.cyan,
      ),
      body: bodyWidget(context),
    );
  }
}
