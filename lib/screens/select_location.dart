import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  var console = Logger();
  int counter = 0;
  @override
  void initState() {
    super.initState();
    console.i('initState function ran');
  }

  @override
  Widget build(BuildContext context) {
    console.i('build function ran');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select a Location'),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          // elevation: 0.0,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  counter += 1;
                });
              },
              child: Text('Counter: $counter')),
        )));
  }
}
