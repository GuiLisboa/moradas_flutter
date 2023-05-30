import 'package:flutter/cupertino.dart';

class Document {
  final IconData leftIcon;
  final Color iconColor;
  final String title;
  final String documentdescription;
  final String documenttype;

  Document({
    required this.leftIcon,
    required this.iconColor,
    required this.title,
    required this.documentdescription,
    required this.documenttype,
  });
}
