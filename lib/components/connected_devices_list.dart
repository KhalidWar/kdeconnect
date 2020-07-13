import 'package:flutter/material.dart';

class Devices {
  Devices({
    this.label,
    this.icon,
    this.isConnected,
  });

  String label;
  IconData icon;
  bool isConnected;
}

List connectedDevicesList = [
  Devices(
    label: 'laptop@kubuntu',
    icon: Icons.laptop,
    isConnected: true,
  ),
  Devices(
    label: 'desktop@kubuntu',
    icon: Icons.desktop_windows,
    isConnected: false,
  )
];
