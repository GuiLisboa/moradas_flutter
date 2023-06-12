import 'package:flutter/material.dart';
import 'package:moradas/features/admin/create_notice_page.dart';
import 'package:moradas/features/admin/create_user_page.dart';
import 'package:moradas/features/admin/list_user_page.dart';
import 'package:moradas/features/components/title_card_initial_widget.dart';

class Initialpage extends StatelessWidget {
  const Initialpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: TitleCardInitialWidget(
                    leftIcon: Icons.notifications,
                    title: 'Avisos',
                    iconColor: Colors.grey),
              )
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: TitleCardInitialWidget(
                    leftIcon: Icons.real_estate_agent,
                    title: 'Reservas',
                    iconColor: Colors.green),
              )
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: TitleCardInitialWidget(
                    leftIcon: Icons.report_problem,
                    title: 'Ocorrencias',
                    iconColor: Colors.redAccent),
              )
            ],
          )),
        ],
      ),
    );
  }
}
