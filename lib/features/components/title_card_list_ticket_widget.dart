import 'package:flutter/material.dart';
import '../../constants.dart';

class TitleCardTicketWidget extends StatelessWidget {
  final IconData leftIcon;
  final Color iconColor;
  final String title;
  final String ticketdescription;
  //final DateTime date;
  final String status;

  const TitleCardTicketWidget({
    super.key,
    required this.leftIcon,
    required this.iconColor,
    required this.title,
    required this.ticketdescription,
    //required this.date,
    required this.status,
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
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    status,
                    style: const TextStyle(
                        fontSize: 18, color: Color(colorBlueSimple)),
                  ),
                  Text(
                    ticketdescription,
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
