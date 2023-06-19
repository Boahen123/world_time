import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  var console = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}
