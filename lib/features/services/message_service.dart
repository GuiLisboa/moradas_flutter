import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MessageService {
  late FToast fToast;

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
}
