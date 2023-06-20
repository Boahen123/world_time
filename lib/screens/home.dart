import 'package:flutter/material.dart';
import 'package:world_clock/screens/select_location.dart';
import 'package:page_transition/page_transition.dart';
import 'package:logger/logger.dart';

var console = Logger();

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Object? data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments;

    // Convert the data Object to a map
    Map dataMap = data as Map;
    console.d(dataMap);

    // Set background image
    // String bgImage = dataMap['isDaytime'] ? 'dayimg' : 'nightime';

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 120.0, 0.0, 0.0),
      child: Column(
        children: <Widget>[
          TextButton.icon(
            onPressed: () {
              // Navigator.pushNamed(context, '/location'); //alternative method
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
              size: 50.0,
            ),
            label: const Text(
              'Edit Location',
              style: TextStyle(color: Colors.black, fontSize: 25.0),
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "${dataMap['location']}",
                style: const TextStyle(
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            "${dataMap['time']}",
            style: const TextStyle(
              fontSize: 80.0,
              letterSpacing: 2.0,
            ),
          ),
        ],
      ),
    )));
  }
}
