import 'package:flutter/material.dart';
import 'package:world_clock/screens/select_location.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Map data = {};

  @override
  Widget build(BuildContext context) {
    data.addAll(ModalRoute.of(context)!.settings.arguments as Map);

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        TextButton.icon(
          onPressed: () {
            // Navigator.pushNamed(context, '/location');
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const SelectLocation(),
              ),
            );
          },
          icon: const Icon(
            Icons.edit_location,
            color: Colors.black,
          ),
          label: const Text(
            'Edit Location',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    )));
  }
}
