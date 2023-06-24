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
WorldTime ivorycoast =
    WorldTime(location: 'Abidjan', endpoint: 'Africa/Abidjan', country: 'CI');
WorldTime ghana =
    WorldTime(location: 'Accra', endpoint: 'Africa/Abidjan', country: 'GH');
WorldTime france =
    WorldTime(location: 'Paris', endpoint: 'Europe/Paris', country: 'FR');
WorldTime canada =
    WorldTime(location: 'Toronto', endpoint: 'America/Toronto', country: 'CA');
WorldTime nigeria =
    WorldTime(location: 'Lagos', endpoint: 'Africa/Lagos', country: 'NG');
WorldTime johannesburg = WorldTime(
    location: 'Johannesburg', endpoint: 'Africa/Johannesburg', country: 'ZA');
WorldTime australia =
    WorldTime(location: 'Sydney', endpoint: 'Australia/Sydney', country: 'AU');
WorldTime hongkong =
    WorldTime(location: 'Hong Kong', endpoint: 'Asia/Hong_Kong', country: 'HK');
WorldTime russia =
    WorldTime(location: 'Moscow', endpoint: 'Europe/Moscow', country: 'RU');

class _SelectLocationState extends State<SelectLocation> {
  List<WorldTime> instancesOfWorldTime = [
    britain,
    germany,
    egypt,
    kenya,
    unitedStatesChicago,
    unitedStatesNewYork,
    ivorycoast,
    ghana,
    france,
    canada,
    nigeria,
    johannesburg,
    australia,
    hongkong,
    russia
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
      body: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        thickness: 10.0,
        child: ListView.builder(
          itemCount: instancesOfWorldTime.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 3.0),
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
      ),
    );
  }
}
