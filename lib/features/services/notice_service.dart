import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants.dart';
import '../../models/notice_model.dart';
import 'message_service.dart';

class NoticeService {
  late FToast fToast;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '$API/notice/findAll',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  Future<List<Notice>> getNotices() async {
    try {
      var url = '$API/notice/findAllNotice';
      var response = await _dio.get(url);
      print(response.data);

      if (response.statusCode == 200) {
        var notices = response.data as List;
        return notices.map((notice) => Notice.fromJson(notice)).toList();
      } else {
        return [];
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      MessageService().errorFail("Erro ao buscar avisos!");
      print(e);
      return [];
    }
  }

  Future<void> addNewNotice(Notice notice) async {
    try {
      var url = '$API/notice/createNotice';
      var response = await _dio.post(url, data: notice.toJson());
      print(response.data);

      if (response.statusCode == 200) {
        MessageService().success("Aviso cadastrado com sucesso!");
      } else {
        MessageService().errorFail("Erro ao cadastrar aviso!");
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      MessageService().errorFail("Erro ao cadastrar aviso!");
      print(e);
    }
  }
}
