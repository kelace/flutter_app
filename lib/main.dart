import 'package:flutter/material.dart';
import 'package:app/src/list.dart';
import 'package:app/src/loader.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text('App')),
        body: Container(
            child: FutureBuilder(
          future: http.get(
              'https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0'),
          builder: (context, snapshot) {
            Widget result;

            if (snapshot.hasData) {
              var loaded = json.decode(snapshot.data.body);
              result = Container(child: MyList(loaded));
            } else if (snapshot.hasError) {
              result = Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Error: ${snapshot.error}'),
                      )
                    ]),
              );
            } else {
              result = new Loader(title: 'Awaiting result...');
            }
            return result;
          },
        )));
  }
}
