// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:moradas/features/components/title_card_initial_notice_list_widget.dart';
import 'package:provider/provider.dart';

import '../controller/notice_controller.dart';

class TitleCardInitialNoticeWidget extends StatelessWidget {
  final IconData leftIcon;
  final String titleCard;
  final Color iconColor;

  const TitleCardInitialNoticeWidget({
    super.key,
    required this.leftIcon,
    required this.titleCard,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final noticeController = context.watch<NoticeController>();

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
            if (noticeController.notices.isEmpty) {
              return const Center(
                heightFactor: 5,
                child: Text(
                  'Nenhum aviso no momento.',
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
                    for (var notice in noticeController.notices)
                      TitleCardInitialNoticeListWidget(
                        title: notice.title!,
                        description: notice.noticedescription!,
                        startDate: notice.startdate!,
                        endDate: notice.enddate!,
                      )
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
