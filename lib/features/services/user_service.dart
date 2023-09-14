import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moradas/features/services/message_service.dart';

import '../../constants.dart';
import '../../models/user_model.dart';

class UserService {
  late FToast fToast;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '$API/user/CreateUser',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  Future addNewUser(context, User currentUser) async {
    fToast = FToast();
    fToast.init(context);

    try {
      var url = '$API/user/CreateUser';
      var response = await _dio.post(url, data: currentUser.toJson());
      MessageService().success("Usuário cadastrado com sucesso!");

      Navigator.of(context).pop();
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      MessageService().errorFail("Erro ao cadastrar usuário!");
    }
  }

  Future<List<User>> getUsers() async {
    try {
      var url = '$API/user/findAll';
      var response = await _dio.get(url);
      print(response.data);

      if (response.statusCode == 200) {
        var users = response.data as List;
        debugPrint('Quantidade no service: ${users.length}');
        return users.map((user) => User.fromJson(user)).toList();
      } else {
        return [];
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      print(e);
      return [];
    }
  }

  Future deleteById(String id) async {
    try {
      var url = '$API/user/deleteById/$id';
      await _dio.delete(url);

      MessageService().success("Usuário excluido com sucesso!");
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      print(e);
    }
  }

  Future updateById(String id, User user) async {
    try {
      var url = '$API/user/updateById/$id';
      await _dio.put(url, data: user.toJson());

      MessageService().success("Usuário atualizado com sucesso!");
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      print(e);
    }
  }
}
