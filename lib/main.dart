import 'package:flutter/material.dart';
import 'package:flutterdex/home_page.dart';
import 'package:flutter/services.dart';

void main() async {
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(new FlutterDex());
  });
}

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
