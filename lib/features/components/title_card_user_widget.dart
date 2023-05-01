import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';

class TitleCardUserWidget extends StatelessWidget {
  final IconData leftIcon;
  final Color iconColor;
  final String name;
  final String phone;
  final String tower;
  final String apartment;

  const TitleCardUserWidget({
    super.key,
    required this.leftIcon,
    required this.iconColor,
    required this.name,
    required this.phone,
    required this.tower,
    required this.apartment,
  });

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
                    name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    phone,
                    style: const TextStyle(
                        fontSize: 18, color: Color(colorBlueSimple)),
                  ),
                  Text(
                    tower,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(colorBlueSimple),
                    ),
                  ),
                  Text(
                    apartment.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(colorBlueSimple),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
