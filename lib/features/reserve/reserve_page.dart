import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/features/components/title_card_reserve_widget.dart';

class ReservePage extends StatelessWidget {
  const ReservePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TitleCardReserveWidget(
              leftIcon: Icons.celebration,
              iconColor: Color(colorBlueSimple),
              title: 'Salão de Festas',
              usageFee: 'Taxa de Uso: R\$ 100,00',
              capacity: 'Capacidade: 100 pessoas'),
        ),
        Expanded(
          child: TitleCardReserveWidget(
              leftIcon: Icons.pool,
              iconColor: Color(colorBlueSimple),
              title: 'Piscina',
              usageFee: 'Taxa de Uso: R\$ 50,00',
              capacity: 'Capacidade: 50 pessoas'),
        ),
        Expanded(
          child: TitleCardReserveWidget(
              leftIcon: Icons.sports_soccer,
              iconColor: Color(colorBlueSimple),
              title: 'Quadra de Futebol',
              usageFee: 'Taxa de Uso: R\$ 50,00',
              capacity: 'Capacidade: 50 pessoas'),
        ),
        Expanded(
          child: TitleCardReserveWidget(
              leftIcon: Icons.sports_tennis,
              iconColor: Color(colorBlueSimple),
              title: 'Quadra de Tênis',
              usageFee: 'Taxa de Uso: R\$ 50,00',
              capacity: 'Capacidade: 50 pessoas'),
        ),
        Expanded(
          child: TitleCardReserveWidget(
              leftIcon: Icons.sports_basketball,
              iconColor: Color(colorBlueSimple),
              title: 'Quadra de Basquete',
              usageFee: 'Taxa de Uso: R\$ 50,00',
              capacity: 'Capacidade: 50 pessoas'),
        ),
        Expanded(
          child: TitleCardReserveWidget(
              leftIcon: Icons.sports_volleyball,
              iconColor: Color(colorBlueSimple),
              title: 'Quadra de Vôlei',
              usageFee: 'Taxa de Uso: R\$ 50,00',
              capacity: 'Capacidade: 50 pessoas'),
        ),
        Expanded(
          child: TitleCardReserveWidget(
              leftIcon: Icons.sports_handball,
              iconColor: Color(colorBlueSimple),
              title: 'Quadra de Handebol',
              usageFee: 'Taxa de Uso: R\$ 50,00',
              capacity: 'Capacidade: 50 pessoas'),
        ),
      ],
    );
  }
}
