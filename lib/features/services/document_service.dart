import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../constants.dart';
import '../../models/document_model.dart';
import 'message_service.dart';

class DocumentService {
  late FToast fToast;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '$API/doc/createDoc',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  Future addNewDocument(context, Document currentDocument) async {
    fToast = FToast();
    fToast.init(context);

    try {
      var url = '$API/doc/createDoc';
      await _dio.post(url, data: currentDocument.toJson());
      MessageService().success("Documento cadastrado com sucesso!");

      Navigator.of(context).pop();
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      MessageService().errorFail("Erro ao cadastrar documento!");
    }
  }

  Future<List<Document>> getDocuments() async {
    try {
      var url = '$API/doc/findAllDoc';
      var response = await _dio.get(url);
      print(response.data);

      if (response.statusCode == 200) {
        var documents = response.data as List;
        debugPrint('Quantidade no service: ${documents.length}');
        return documents
            .map((document) => Document.fromJson(document))
            .toList();
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

  Future addNewFile(context, String correntPath) async {
    fToast = FToast();
    fToast.init(context);

    print("file base name:$correntPath");

    try {
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(correntPath),
      });

      Response response = await Dio().post('$APIdoc/upload', data: formData);

      print("File upload response: $response");
    } catch (e) {
      print("expectation Caugch: $e");
    }
  }
}
