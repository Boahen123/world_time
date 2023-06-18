import 'package:flutter/material.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select a Location'),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          // elevation: 0.0,
        ),
        body: const SafeArea(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Select location'),
        )));
  }
}
