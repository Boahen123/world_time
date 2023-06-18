import 'package:flutter/material.dart';
import 'package:world_clock/screens/select_location.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
                  type: PageTransitionType.bottomToTop,
                  child: const SelectLocation(),
                  duration: const Duration(seconds: 3),
                  reverseDuration: const Duration(seconds: 3)),
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
