import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../models/user_model.dart';

class UserService {
  // addNewUser2() async {
  //   try {
  //     var url = '$API/user/CreateUser';
  //     var response = await http.post(Uri.parse('$API/user/createUser'), body: {
  //       "idMorador": "7",
  //       "fullname": "Celso Lisboa Chaves",
  //       "cpf": "40040040040",
  //       "phone": "41965748522",
  //       "email": "chaves.clc@hotmail.com",
  //       "tower": "2",
  //       "apartment": "431",
  //       "password": "1234"
  //     });
  //     print(response.body);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> addNewUser(context, User currentUser) async {
  //   try {
  //     var url = '$API/user/CreateUser';
  //     var response = await http.post(Uri.parse(url),
  //         headers: {"Content-Type": "application/json"},
  //         body: jsonEncode({
  //           "fullName": currentUser.fullName,
  //           "cpf": currentUser.cpf,
  //           "phone": currentUser.phone,
  //           "email": currentUser.email,
  //           "tower": currentUser.tower,
  //           "apartment": currentUser.apartment,
  //           "password": currentUser.password,
  //           "createdOn": currentUser.createdOn,
  //           "isAdmin": currentUser.isAdmin,
  //           "isActive": currentUser.isActive,
  //         }));
  //     print(response.body);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Dio dio = Dio();
  late FToast fToast;

  Future addNewUser(context, User currentUser) async {
    fToast = FToast();
    fToast.init(context);

    try {
      var url = '$API/user/CreateUser';
      var response = await dio.post(url, data: currentUser.toJson());
      print(response.data);

      Fluttertoast.showToast(
          msg: "Usuário cadastrado com sucesso!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green[200],
          textColor: Colors.green[900],
          fontSize: 26.0);

      // fToast.showToast(
      //     child: Text(
      //       "Usuário cadastrado com sucesso!",
      //       style: TextStyle(color: Colors.white),
      //     ),
      //     gravity: ToastGravity.CENTER,
      //     toastDuration: Duration(seconds: 2));
    } catch (e) {
      print(e);
    }
  }
}
