import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';

var console = Logger();

class WorldTime {
  final String? location; // location for the URI endpoint
  late String? time; // current time in the specified location
  final String? flag; // url to get a flag icon
  final String? endpoint;

  WorldTime({this.location, this.flag, this.endpoint});

  /// The function retrieves the current time from an API and adjusts it based on the timezone offset.
  Future<void> getTime() async {
    try {
      // Create url
      final url = Uri.parse('https://worldtimeapi.org/api/timezone/$endpoint');
      var response = await http.get(url);

      // decode json
      // const JsonDecoder decoder = JsonDecoder(); // an alternative method
      // final Map<String, dynamic> data = decoder.convert(response.body);
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime currentTime = DateTime.parse(datetime);
      currentTime = currentTime.add(Duration(hours: int.parse(offset)));
      time = currentTime.toString();
    } catch (exception) {
      console.d('Caught error $exception');
      time = 'Could not get time data';
    }
  }
}
