import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:provider/provider.dart';

import '../../models/document_model.dart';
import '../controller/document_controller.dart';

class CreateDocumentsPage extends StatefulWidget {
  const CreateDocumentsPage({super.key});

  @override
  State<CreateDocumentsPage> createState() => _CreateDocumentsPageState();
}

class _CreateDocumentsPageState extends State<CreateDocumentsPage> {
  Document document = new Document();
  FilePickerResult? result;

  TextEditingController _controllerDocumentName = TextEditingController();

  Future getFile() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    ).then((value) {
      setState(() {
        if (value != null) {
          _controllerDocumentName.text = value.files.first.name;
          document.nameFile = value.files.first.name.replaceAll(' ', '');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final documentController = context.watch<DocumentController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Documentos'),
        backgroundColor: Color(colorBlueSimple),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    TextFormField(
                      controller: null,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Título do documento.',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.description,
                          )),
                      onChanged: (text) {
                        document.title = text;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    TextFormField(
                      controller: null,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Descrição do documento.',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.article,
                          )),
                      onChanged: (text) {
                        document.description = text;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    TextFormField(
                      controller: _controllerDocumentName,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Escolha um Documento.',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.post_add,
                          )),
                      onTap: () {
                        getFile();
                      },
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 24),
                shape: StadiumBorder(),
                backgroundColor: Colors.amber,
              ),
              child: Text('Criar Documento'),
              onPressed: () {
                documentController.addNewDocument(context, document);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
