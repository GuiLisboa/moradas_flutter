import 'package:flutter/material.dart';
import 'package:moradas/features/components/title_card_initial_widget.dart';
import 'package:moradas/features/controller/notice_controller.dart';
import 'package:provider/provider.dart';

class Initialpage extends StatefulWidget {
  const Initialpage({super.key});

  @override
  State<Initialpage> createState() => _InitialpageState();
}

class _InitialpageState extends State<Initialpage> {
  @override
  Widget build(BuildContext context) {
    final noticeController = context.watch<NoticeController>();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: TitleCardInitialWidget(
                  leftIcon: Icons.notifications,
                  titleCard: 'Avisos',
                  iconColor: Colors.grey,
                ),
              )
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: TitleCardInitialWidget(
                  leftIcon: Icons.real_estate_agent,
                  titleCard: 'Reservas',
                  iconColor: Colors.green,
                ),
              )
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: TitleCardInitialWidget(
                  leftIcon: Icons.report_problem,
                  titleCard: 'Ocorrencias',
                  iconColor: Colors.redAccent,
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
