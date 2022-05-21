import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class httpSample extends StatefulWidget {
  const httpSample({Key? key}) : super(key: key);

  @override
  State<httpSample> createState() => _httpSampleState();
}

class _httpSampleState extends State<httpSample> {
  httpGet() async {
    try {
      //var response = await http.get(Uri.parse('https://json.flutter.su/echo'));
      var response = await http.post(Uri.parse('https://json.flutter.su/echo'),
          body: {'name': 'My Name', 'num': '10'},
          headers: {'Accept': 'application/json'});

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Sample'),
      ),
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(children: [
          Padding(
            padding: EdgeInsets.all(10),
          ),
          ElevatedButton(
            child: Text('Press me'),
            onPressed: httpGet,
            /*() {
            http
                .get(Uri.parse('https://json.flutter.su/echo'))
                .then((response) {
              print('Response status: ${response.statusCode}');
              print('Response body: ${response.body}');
            }).catchError((error) {
              print('Error: $error');
            });
          },*/
          ),
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
            child: Text('From git'),
            onPressed: (){} //httpSampleCloned(),
          )
        ]),
      ]),
    );
  }
}

