import 'package:flutter/material.dart';
import 'package:sample/constants.dart';

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
    label: kConnectedDeviceText,
    icon: kConnectedDeviceIcon,
    isConnected: true,
  ),
  Devices(
    label: kConnectedDevice2Text,
    icon: kConnectedDevice2Icon,
    isConnected: false,
  )
];
