import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  final String title;
  Loader({this.title = ''});
  _Loader createState() => _Loader();
}

class _Loader extends State<Loader> {
  _Loader();

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(widget.title),
            )
          ]),
    );
  }
}
