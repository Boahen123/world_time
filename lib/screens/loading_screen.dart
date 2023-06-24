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
    WorldTime timeInstance =
        WorldTime(location: 'Accra', endpoint: 'Africa/Abidjan', country: 'GH');
    await timeInstance.getTime();

    if (context.mounted) {
      // pass data from loading_screen.dart to home
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': timeInstance.location,
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
