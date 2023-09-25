import 'package:flutter/material.dart';
import 'package:moradas/features/controller/notice_controller.dart';
import 'package:moradas/features/controller/ticket_controller.dart';
import 'package:provider/provider.dart';

import '../../features/components/title_card_initial_notice_widget.dart';
import '../../features/components/title_card_initial_reserve_widget.dart';
import '../../features/components/title_card_initial_ticket_widget.dart';
import '../../features/controller/reserve_controller.dart';

class Initialpage extends StatefulWidget {
  const Initialpage({super.key});

  @override
  State<Initialpage> createState() => _InitialpageState();
}

class _InitialpageState extends State<Initialpage> {
  @override
  Widget build(BuildContext context) {
    final noticeController = context.watch<NoticeController>();
    final reserveController = context.watch<ReserveController>();
    final ticketController = context.watch<TicketController>();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: TitleCardInitialNoticeWidget(
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
                child: TitleCardInitialReserveWidget(
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
                child: TitleCardInitialTicketWidget(
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
