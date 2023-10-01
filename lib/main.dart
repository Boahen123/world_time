import 'package:flutter/material.dart';
import 'package:world_clock/screens/home.dart';
import 'package:world_clock/screens/loading_screen.dart';
import 'package:world_clock/screens/select_location.dart';

void main() {
  // Define your named routes
  final Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    '/': (BuildContext context) => const Loading(),
    '/home': (BuildContext context) => const Home(),
    '/location': (BuildContext context) => const SelectLocation(),
  };

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: routes,
  ));
}
