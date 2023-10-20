import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/features/components/title_card_document_widget.dart';
import 'package:provider/provider.dart';

import '../../features/controller/document_controller.dart';
import '../../models/document_model.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({super.key});

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  List<Document> documents = [];

  @override
  void initState() {
    super.initState();
    Provider.of<DocumentController>(context, listen: false).getDocuments();
  }

  Widget build(BuildContext context) {
    final documentController = context.watch<DocumentController>();
    documents = documentController.documents;

    return Scaffold(
      appBar: AppBar(
        title: Text('Documentos'),
        backgroundColor: Color(colorBlueSimple),
      ),
      body: (() {
        if (documents.isEmpty) {
          return Center(
            child: Text(
              'Nenhum documento cadastrado.',
              style: TextStyle(fontSize: 20),
            ),
          );
        } else {
          return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, int index) {
                return TitleCardDocumentWidget(
                  document: documents[index],
                );
              });
        }
      }()),
    );
  }
}
