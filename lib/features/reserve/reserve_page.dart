import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/features/components/title_card_reserve_widget.dart';

class ReservePage extends StatelessWidget {
  const ReservePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: TitleCardReserveWidget(leftIcon: Icons.celebration, iconColor: Color(colorBlueSimple), title: 'Salão de Festas', usageFee: 'Taxa de Uso: R\$ 100,00', capacity: 'Capacidade: 100 pessoas'),
        ),
        Expanded(
          child: Container(),
        ),
      ],
    );
  }
}
