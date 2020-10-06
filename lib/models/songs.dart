import 'package:flutter/material.dart';

class Song {
  Song({
    @required this.title,
    @required this.image,
    @required this.credit,
    @required this.url,
  });

  String title;
  String image;
  String credit;
  String url;
}
