import 'package:flutter/material.dart';

class Notice {
  final IconData leftIcon;
  final Color iconColor;
  final String title;
  final String noticedescription;
  final DateTime startdate;
  final DateTime enddate;

  Notice({
    required this.leftIcon,
    required this.iconColor,
    required this.title,
    required this.noticedescription,
    required this.startdate,
    required this.enddate,
  });
}
