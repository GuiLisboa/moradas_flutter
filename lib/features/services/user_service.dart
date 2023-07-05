import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants.dart';
import '../../models/user_model.dart';

class UserService extends ChangeNotifier {
  late FToast fToast;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '$API/user/CreateUser',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  void success(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.green[200],
        textColor: Colors.green[900],
        fontSize: 26.0);
  }

  void errorTimeOut(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red[200],
        textColor: Colors.red[900],
        fontSize: 26.0);
  }

  void errorFail(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red[200],
        textColor: Colors.red[900],
        fontSize: 26.0);
  }

  Future addNewUser(context, User currentUser) async {
    fToast = FToast();
    fToast.init(context);

    try {
      var url = '$API/user/CreateUser';
      await _dio.post(url, data: currentUser.toJson());

      success("Usuário cadastrado com sucesso!");

      Navigator.of(context).pop();
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        errorTimeOut("Erro ao comunicar com o servidor!");
      }
      errorFail("Erro ao cadastrar usuário!");
    }
  }

  Future<List<User>> getUsers() async {
    try {
      var url = '$API/user/findAll';
      var response = await _dio.get(url);
      print(response.data);
      if (response.statusCode == 200) {
        var users = response.data as List;
        return users.map((user) => User.fromJson(user)).toList();
      } else {
        return [];
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        errorTimeOut("Erro ao comunicar com o servidor!");
      }
      print(e);
      return [];
    }
  }

  Future deleteById(String id) async {
    try {
      var url = '$API/user/deleteById/$id';
      await _dio.delete(url);

      success("Usuário excluido com sucesso!");
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        errorTimeOut("Erro ao comunicar com o servidor!");
      }
      print(e);
    }
  }

  Future updateById(String id, User user) async {
    try {
      var url = '$API/user/updateById/$id';
      await _dio.put(url, data: user.toJson());

      success("Usuário atualizado com sucesso!");
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        errorTimeOut("Erro ao comunicar com o servidor!");
      }
      print(e);
    }
  }
}
