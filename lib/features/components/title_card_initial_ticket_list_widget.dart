import 'package:flutter/material.dart';

import '../../constants.dart';

class TitleCardInitialTicketListWidget extends StatelessWidget {
  final String title;
  final String description;
  final String status;

  const TitleCardInitialTicketListWidget({
    super.key,
    required this.title,
    required this.description,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 20,
              ),
              Text('Título: ',
                  style: const TextStyle(
                      fontSize: 18, color: Color(colorBlueSimple))),
              Text(
                  title!.substring(0, title!.length > 25 ? 25 : title!.length) +
                      "...",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Color(colorBlueSimple),
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              Text('Descrição: ',
                  style: const TextStyle(
                      fontSize: 18, color: Color(colorBlueSimple))),
              Text(
                  description!.substring(0,
                          description!.length > 28 ? 28 : description!.length) +
                      "...",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Color(colorBlueSimple),
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              Text('Status: ',
                  style: const TextStyle(
                      fontSize: 18, color: Color(colorBlueSimple))),
              Text(status!,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Color(colorBlueSimple),
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
