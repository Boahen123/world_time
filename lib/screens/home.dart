import 'package:flutter/material.dart';
// import 'package:world_clock/screens/select_location.dart';
// import 'package:page_transition/page_transition.dart';
import 'package:logger/logger.dart';

var console = Logger();

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Object data = {};

  @override
  Widget build(BuildContext context) {
    // Convert the data Object to a map
    Map dataMap = data as Map;
    dataMap = dataMap.isNotEmpty
        ? dataMap
        : ModalRoute.of(context)?.settings.arguments as Map;
    console.d(dataMap);

    // Set background image depending on the time
    String bgImage = dataMap['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = dataMap['isDaytime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    // Navigator.pushNamed(context, '/location'); //alternative method
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'time': result['time'],
                        'isDaytime': result['isDaytime']
                      };
                    });
                  },
                  icon: const Icon(
                    Icons.edit_location,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  label: const Text(
                    'Edit Location',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
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
                          color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  "${dataMap['time']}",
                  style: const TextStyle(
                      fontSize: 80.0, letterSpacing: 2.0, color: Colors.white),
                ),
              ],
            ),
          ),
        )));
  }
}
