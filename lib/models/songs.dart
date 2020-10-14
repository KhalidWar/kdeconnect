import 'package:flutter/material.dart';

class Song {
  const Song({
    @required this.title,
    @required this.image,
    @required this.credit,
    @required this.url,
  });

  final String title;
  final String image;
  final String credit;
  final String url;
}
