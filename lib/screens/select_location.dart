import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:world_clock/widgets/world_time.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

WorldTime britain =
    WorldTime(location: 'London', endpoint: 'Europe/London', country: 'GB');
WorldTime germany =
    WorldTime(location: 'Berlin', endpoint: 'Europe/Berlin', country: 'DE');
WorldTime egypt =
    WorldTime(location: 'Cairo', endpoint: 'Africa/Cairo', country: 'EG');
WorldTime kenya =
    WorldTime(location: 'Nairobi', endpoint: 'Africa/Nairobi', country: 'KE');
WorldTime unitedStatesChicago =
    WorldTime(location: 'Chicago', endpoint: 'America/Chicago', country: 'US');
WorldTime unitedStatesNewYork = WorldTime(
    location: 'New York', endpoint: 'America/New_York', country: 'US');

class _SelectLocationState extends State<SelectLocation> {
  List<WorldTime> instancesOfWorldTime = [
    britain,
    germany,
    egypt,
    kenya,
    unitedStatesChicago,
    unitedStatesNewYork
  ];

  var console = Logger();

  Future<void> updateTime(index) async {
    WorldTime instance = instancesOfWorldTime[index];
    await instance.getTime();

    // Navigate to home
    if (context.mounted) {
      Navigator.pop(context, {
        'location': instance.location,
        'time': instance.time,
        'isDaytime': instance.isDaytime,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemCount: instancesOfWorldTime.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 3.0),
            child: Card(
              child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text('${instancesOfWorldTime[index].location}'),
                  leading: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: instancesOfWorldTime[index].getFlag(),
                      ),
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
