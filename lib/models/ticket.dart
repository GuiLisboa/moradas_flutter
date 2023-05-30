import 'package:flutter/material.dart';
import 'package:moradas/models/user.dart';

class Ticket {
  final IconData leftIcon;
  final Color iconColor;
  final DateTime createdOn;
  final String tickettype;
  final String ticketdescription;
  final User user;
  final String status;

  Ticket({
    required this.leftIcon,
    required this.iconColor,
    required this.createdOn,
    required this.tickettype,
    required this.ticketdescription,
    required this.user,
    required this.status,
  });
}
