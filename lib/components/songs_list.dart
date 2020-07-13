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

List songsList = [
  Song(
      title: 'Michael Bublé - Feeling Good',
      image: 'assets/images/good feeling.jpeg',
      credit: 'Photo by Aman Shrivastava on Unsplash',
      url: 'https://unsplash.com/photos/w6caoaJzXIE'),
  Song(
      title: 'Aloe Blacc - The Man',
      image: 'assets/images/the man.jpg',
      credit: 'Photo by Hunters Race on Unsplash',
      url: 'https://unsplash.com/photos/MYbhN8KaaEc'),
];
