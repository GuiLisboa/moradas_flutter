import 'package:flutter/material.dart';
import 'package:moradas/features/services/notice_service.dart';
import 'package:moradas/models/notice_model.dart';

class NoticeController extends ChangeNotifier {
  List<Notice> notices = [];

  NoticeService noticeService = NoticeService();

  NoticeController() {
    getNotices();
  }

  getNotices() async {
    notices = await noticeService.getNotices();
    notifyListeners();
  }

  addNewNotice(Notice notice) async {
    await noticeService.addNewNotice(notice);
    notices.add(notice);
    notifyListeners();
  }
}
