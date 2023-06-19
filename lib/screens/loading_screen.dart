import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';

var console = Logger();

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    var response = await http.get(url);
    const JsonDecoder decoder = JsonDecoder();

    final Map<String, dynamic> object = decoder.convert(response.body);

    console.d(object['title']);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('loading screen'));
  }
}
