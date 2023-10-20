import 'package:flutter/material.dart';

class Document {
  int? idDocument;
  late String? title;
  late String? description;
  late String? nameFile;

  Document({
    this.title,
    this.description,
    this.nameFile,
  });

  Document.fromJson(Map<String, dynamic> json) {
    idDocument = json['id'];
    title = json['tituloDocumento'];
    description = json['descricaoDocumento'];
    nameFile = json['nomeDocumento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tituloDocumento'] = title;
    data['descricaoDocumento'] = description;
    data['nomeDocumento'] = nameFile;
    return data;
  }
}
