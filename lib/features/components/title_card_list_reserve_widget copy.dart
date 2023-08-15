// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/models/reserve_model.dart';

import '../../models/reserve_location_model.dart';

class TitleCardReserveWidget2 extends StatelessWidget {
  final IconData leftIcon;
  final Color iconColor;
  Reserve reserve = Reserve();

  TitleCardReserveWidget2({
    Key? key,
    this.leftIcon = Icons.people_alt,
    this.iconColor = const Color(colorBlueSimple),
    required this.reserve,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white54),
      child: ListTile(
        leading: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            leftIcon,
            color: iconColor,
            size: 30,
          )
        ]),
        title: Text(reserve.title!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Taxa de uso: ',
                    style: const TextStyle(
                        fontSize: 18, color: Color(colorBlueSimple))),
                Text('R\$${reserve.usageFee!},00',
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(colorBlueSimple),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                Text('Capacidade: ',
                    style: const TextStyle(
                        fontSize: 18, color: Color(colorBlueSimple))),
                Text('${reserve.capacity!} pessoas',
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(colorBlueSimple),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                Text('Data da reserva: ',
                    style: const TextStyle(
                        fontSize: 18, color: Color(colorBlueSimple))),
                Text(
                    (reserve.dateReserve!.substring(8, 10) +
                        "/" +
                        reserve.dateReserve!.substring(5, 7) +
                        "/" +
                        reserve.dateReserve!.substring(0, 4)),
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(colorBlueSimple),
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
