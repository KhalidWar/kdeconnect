import 'package:flutter/material.dart';

class Files {
  const Files({
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
