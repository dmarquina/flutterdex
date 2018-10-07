import 'package:flutter/material.dart';
import 'package:flutterdex/homepage.dart';

void main() => runApp(new FlutterDex());

class FlutterDex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterDex",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }

}



