import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:app/src/loader.dart';

class PhotoPage extends StatelessWidget {
  final String imgSrc;

  PhotoPage(this.imgSrc);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('App')),
      body: CachedNetworkImage(
        imageUrl: imgSrc,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
          ),
        ),
        placeholder: (context, url) => Center(child: Loader()),
        errorWidget: (context, url, error) => new Icon(Icons.error),
      ),
    );
  }
}
