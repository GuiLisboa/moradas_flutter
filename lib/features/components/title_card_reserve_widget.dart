// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TitleCardReserveWidget extends StatelessWidget {
  final IconData leftIcon;
  final Color iconColor;
  final String title;
  final String usageFee; //taxa de uso
  final String capacity;

  const TitleCardReserveWidget({
    Key? key,
    required this.leftIcon,
    required this.iconColor,
    required this.title,
    required this.usageFee,
    required this.capacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white54),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    leftIcon,
                    color: iconColor,
                    size: 30,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    usageFee,
                    style:
                        const TextStyle(fontSize: 18, color: Color(0xFF6CA8F1)),
                  ),
                  Text(
                    capacity,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF6CA8F1),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
