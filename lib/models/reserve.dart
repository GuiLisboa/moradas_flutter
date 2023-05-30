import 'package:flutter/material.dart';

class Reserve {
  final IconData leftIcon;
  final Color iconColor;
  final String title;
  final String usageFee;
  final String capacity;

  Reserve({
    required this.leftIcon,
    required this.iconColor,
    required this.title,
    required this.usageFee,
    required this.capacity,
  });
}
