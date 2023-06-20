import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:world_clock/widgets/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

var console = Logger();

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime timeInstance = WorldTime(
        location: 'Berlin', flag: 'germany.png', endpoint: 'Europe/Berlin');
    await timeInstance.getTime();

    if (context.mounted) {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': timeInstance.location,
        'flag': timeInstance.flag,
        'time': timeInstance.time,
        'isDaytime': timeInstance.isDaytime,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
