import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moradas/features/services/document_service.dart';
import '../../models/document_model.dart';

class DocumentController extends ChangeNotifier {
  List<Document> documents = [];

  DocumentService documentService = DocumentService();

  DocumentController() {
    getDocuments();
  }

  getDocuments() async {
    documents = await documentService.getDocuments();
    notifyListeners();
  }

  addNewDocument(context, Document currentDocument) async {
    await documentService.addNewDocument(context, currentDocument);
    documents.add(currentDocument);
    notifyListeners();
  }

  addNewFile(context, String filePath) async {
    await documentService.addNewFile(context, filePath);
    notifyListeners();
  }
}
