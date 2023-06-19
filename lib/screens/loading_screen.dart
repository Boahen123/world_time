import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:world_clock/widgets/world_time.dart';

var console = Logger();

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? currentTime = 'loading';

  void setupWorldTime() async {
    WorldTime timeInstance = WorldTime(
        location: 'Berlin', flag: 'germany.png', endpoint: 'Europe/Berlin');
    await timeInstance.getTime();
    console.d(timeInstance.time);
    setState(() {
      currentTime = timeInstance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Text('$currentTime'),
      ),
    ));
  }
}
