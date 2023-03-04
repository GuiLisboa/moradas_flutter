import 'package:flutter/material.dart';
import 'package:moradas/features/components/title_card_widget.dart';

class Initialpage extends StatelessWidget {
  const Initialpage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: TitleCardWidget(leftIcon: Icons.notifications, title: 'Avisos', iconColor: Colors.grey),
            )
          ],
        )),
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: TitleCardWidget(leftIcon: Icons.real_estate_agent, title: 'Reservas', iconColor: Colors.green),
            )
          ],
        )),
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: TitleCardWidget(leftIcon: Icons.report_problem, title: 'Ocorrencias', iconColor: Colors.redAccent),
            )
          ],
        )),
      ],
    );
  }
}
