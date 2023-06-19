import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  var console = Logger();

  // simulating an asynchrounous network request
  void getData() async {
    await Future.delayed(
      const Duration(seconds: 5),
      () {
        console.i('first statement');
      },
    );

    Future.delayed(const Duration(seconds: 2), () {
      console.i('second statement');
    });

    console.d('synchrounous statement');
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // console.i('build function ran');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        // elevation: 0.0,
      ),
    );
  }
}
