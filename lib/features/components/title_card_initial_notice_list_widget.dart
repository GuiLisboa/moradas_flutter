import 'package:flutter/material.dart';

import '../../constants.dart';

class TitleCardInitialNoticeListWidget extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  const TitleCardInitialNoticeListWidget({
    super.key,
    required this.title,
    required this.description,
    required this.date,
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
              Text('Aviso: ',
                  style: const TextStyle(
                      fontSize: 18, color: Color(colorBlueSimple))),
              Text(title!,
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
              Text(description!,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Color(colorBlueSimple),
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              Text('Data Início: ',
                  style: const TextStyle(
                      fontSize: 18, color: Color(colorBlueSimple))),
              (() {
                if (date!.length > 20) {
                  return Text(
                      (date!.substring(8, 10) +
                          "/" +
                          date!.substring(5, 7) +
                          "/" +
                          date!.substring(0, 4)),
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color(colorBlueSimple),
                          fontWeight: FontWeight.bold));
                } else {
                  return Text(date!,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color(colorBlueSimple),
                          fontWeight: FontWeight.bold));
                }
              }()),
            ],
          ),
        ],
      ),
    );
  }
}
