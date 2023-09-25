// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:moradas/features/components/title_card_initial_notice_list_widget.dart';
import 'package:moradas/features/components/title_card_initial_ticket_list_widget.dart';
import 'package:moradas/features/controller/ticket_controller.dart';
import 'package:provider/provider.dart';

import '../controller/notice_controller.dart';

class TitleCardInitialTicketWidget extends StatelessWidget {
  final IconData leftIcon;
  final String titleCard;
  final Color iconColor;

  const TitleCardInitialTicketWidget({
    super.key,
    required this.leftIcon,
    required this.titleCard,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final ticketController = context.watch<TicketController>();

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white54,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                leftIcon,
                color: iconColor,
                size: 30,
              ),
              Text(titleCard,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  )),
            ],
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                for (var ticket in ticketController.tickets)
                  if (ticket.status == 'Aberto')
                    TitleCardInitialTicketListWidget(
                      title: ticket.ticketDescription!,
                      description: ticket.ticketLocalDescription!,
                      status: ticket.status!,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
