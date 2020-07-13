import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Files {
  Files({
    @required this.icon,
    @required this.name,
    @required this.type,
    @required this.date,
    @required this.size,
  });

  final IconData icon;
  final String name;
  final String type;
  final DateTime date;
  final String size;
}

List filesList = [
  Files(
    icon: FontAwesomeIcons.filePdf,
    name: '2020-06-11',
    type: 'PDF',
    date: DateTime.now(),
    size: '512 kb',
  ),
  Files(
    icon: FontAwesomeIcons.fileAlt,
    name: '0000',
    type: 'TXT',
    date: DateTime.now(),
    size: '1 MB',
  ),
  Files(
    icon: FontAwesomeIcons.filePdf,
    name: 'Final Edit',
    type: 'PDF',
    date: DateTime.now(),
    size: '1 MB',
  ),
  Files(
    icon: FontAwesomeIcons.fileImage,
    name: 'that is not what ... meme',
    type: 'JPEG',
    date: DateTime.now(),
    size: '1 MB',
  ),
  Files(
    icon: FontAwesomeIcons.filePdf,
    name: 'Bitcoin Whitepaper',
    type: 'PDF',
    date: DateTime.now(),
    size: '10 MB',
  ),
  Files(
    icon: FontAwesomeIcons.fileAlt,
    name: 'Revisions',
    type: 'TXT',
    date: DateTime.now(),
    size: '1 MB',
  ),
  Files(
    icon: FontAwesomeIcons.fileImage,
    name: 'KDE desktop screenshot',
    type: 'JPEG',
    date: DateTime.now(),
    size: '6 MB',
  ),
  Files(
    icon: FontAwesomeIcons.filePdf,
    name: '2020-06-11',
    type: 'PDF',
    date: DateTime.now(),
    size: '512 kb',
  ),
  Files(
    icon: FontAwesomeIcons.fileAlt,
    name: 'Final Edit',
    type: 'TXT',
    date: DateTime.now(),
    size: '1 MB',
  ),
  Files(
    icon: FontAwesomeIcons.filePdf,
    name: 'Final Edit',
    type: 'PDF',
    date: DateTime.now(),
    size: '1 MB',
  ),
  Files(
    icon: FontAwesomeIcons.fileImage,
    name: 'Meme of the moment',
    type: 'JPG',
    date: DateTime.now(),
    size: '1 MB',
  ),
  Files(
    icon: FontAwesomeIcons.filePdf,
    name: 'Bitcoin Whitepaper',
    type: 'PDF',
    date: DateTime.now(),
    size: '10 MB',
  ),
  Files(
    icon: FontAwesomeIcons.fileAlt,
    name: 'Event log',
    type: 'TXT',
    date: DateTime.now(),
    size: '1 MB',
  ),
  Files(
    icon: FontAwesomeIcons.fileImage,
    name: '2020 in a pic',
    type: 'JPEG',
    date: DateTime.now(),
    size: '9 MB',
  ),
];
