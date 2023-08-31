import 'package:flutter/material.dart';

class DeviceEntity {
  final String name;
  final String brand;
  final String fullName;
  final double consumption;
  final IconData iconData;
  final bool status;

  DeviceEntity({
    required this.name,
    required this.brand,
    required this.fullName,
    required this.consumption,
    required this.iconData,
    required this.status,
  });
}
