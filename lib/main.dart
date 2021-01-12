import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:contact_app/ContactDetail.dart';

void main() {
  // runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  String url = 'https://randomuser.me/api/?results=15';
  List data;

  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var jsonResponse = json.decode(response.body);
      data = jsonResponse['results'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact App'),
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ContactDetail(data[index]))),
                title: Text(data[index]['name']['first']),
                subtitle: Text(data[index]['phone']),
                trailing: CircleAvatar(
                  backgroundImage:
                      NetworkImage(data[index]['picture']['thumbnail']),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
