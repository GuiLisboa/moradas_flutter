import 'package:flutter/material.dart';

import '../../constants.dart';

class TitleCardInitialNoticeListWidget extends StatelessWidget {
  final String title;
  final String description;
  final String startDate;
  final String endDate;

  const TitleCardInitialNoticeListWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.startDate,
      required this.endDate});

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
              const Text('Aviso: ',
                  style:
                      TextStyle(fontSize: 18, color: Color(colorBlueSimple))),
              Text(title!,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Color(colorBlueSimple),
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              const Text('Descrição: ',
                  style:
                      TextStyle(fontSize: 18, color: Color(colorBlueSimple))),
              Text(description!,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Color(colorBlueSimple),
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              const Text('Início: ',
                  style:
                      TextStyle(fontSize: 18, color: Color(colorBlueSimple))),
              (() {
                if (startDate!.length > 20) {
                  return Text(
                      ("${startDate.substring(8, 10)}/${startDate.substring(5, 7)}/${startDate.substring(0, 4) + "    "}"),
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color(colorBlueSimple),
                          fontWeight: FontWeight.bold));
                } else {
                  return Text(startDate!,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color(colorBlueSimple),
                          fontWeight: FontWeight.bold));
                }
              }()),
              const Text('Fim: ',
                  style:
                      TextStyle(fontSize: 18, color: Color(colorBlueSimple))),
              (() {
                if (endDate!.length > 20) {
                  return Text(
                      ("${endDate.substring(8, 10)}/${endDate.substring(5, 7)}/${endDate.substring(0, 4)}"),
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color(colorBlueSimple),
                          fontWeight: FontWeight.bold));
                } else {
                  return Text(endDate!,
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
