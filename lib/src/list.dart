import 'package:app/src/photo_page.dart';
import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class MyList extends StatelessWidget {
  final List data;

  MyList(this.data);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: _listBuilder(data, context),
    );
  }

  Widget _listBuilder(data, context) {
    List list = data.map<Widget>((item) {
      String title = item['alt_description'] == null
          ? 'no description'
          : item['alt_description'];
      String subTitle = item['user']['name'] == null
          ? 'nameless author'
          : item['user']['name'];
      String imgFull = item['urls']['full'];

      return (ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        leading: CircularProfileAvatar(
          item['urls']['thumb'],
          radius: 20,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return new PhotoPage(imgFull);
            }));
          },
        ),
      ));
    }).toList();

    return ListView(children: list);
  }
}
