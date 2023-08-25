import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants.dart';
import '../../models/user_login_model.dart';
import '../../models/user_model.dart';
import 'message_service.dart';

class UserLoginService {
  late FToast fToast;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '$API/login/findByLogin',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  Future<List<User>> findByLogin(UserLogin login) async {
    try {
      var url = '$API/login/findByLogin';
      var response = await _dio.post(url, data: login.toJson());
      print(response.data);

      if (response.statusCode == 200) {
        var userReturn = response.data as List;
        return userReturn.map((user) => User.fromJson(user)).toList();
      } else {
        return [];
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      print(e);
      MessageService().errorFail("Usuário e senha inválido!");
      return [];
    }
  }
}
