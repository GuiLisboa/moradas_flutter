// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:moradas/features/components/title_card_initial_reserve_list_widget.dart';
import 'package:moradas/features/controller/reserve_controller.dart';
import 'package:provider/provider.dart';

class TitleCardInitialReserveWidget extends StatelessWidget {
  final IconData leftIcon;
  final String titleCard;
  final Color iconColor;

  const TitleCardInitialReserveWidget({
    super.key,
    required this.leftIcon,
    required this.titleCard,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final reserveController = context.watch<ReserveController>();

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
          (() {
            if (reserveController.reserves.isEmpty) {
              return const Center(
                heightFactor: 5,
                child: Text(
                  'Nenhuma reserva no seu nome.',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1.5,
                  ),
                ),
              );
            } else {
              return Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (var reserves in reserveController.reserves)
                      TitleCardInitialReserveListWidget(
                        title: reserves.title!,
                        capacity: reserves.capacity!,
                        date: reserves.dateReserve!,
                      ),
                  ],
                ),
              );
            }
          }()),
        ],
      ),
    );
  }
}
