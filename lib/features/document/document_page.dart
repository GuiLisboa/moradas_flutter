import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/features/components/title_card_document_widget.dart';

class DocumentPage extends StatelessWidget {
  const DocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TitleCardDocumentWidget(
            leftIcon: Icons.description,
            iconColor: Color(colorBlueSimple),
            title: 'Documento ATA 12/04/2023',
            documentdescription: 'ATA referente a reunião do...'),
        TitleCardDocumentWidget(
            leftIcon: Icons.group,
            iconColor: Color(colorBlueSimple),
            title: 'Regras de convivência',
            documentdescription: 'Manual de regras de conviv...'),
        TitleCardDocumentWidget(
            leftIcon: Icons.pool,
            iconColor: Color(colorBlueSimple),
            title: 'Manual para uso da piscina',
            documentdescription: 'Manual para regras do uso ...'),
        TitleCardDocumentWidget(
            leftIcon: Icons.outdoor_grill,
            iconColor: Color(colorBlueSimple),
            title: 'Manual para uso da churrasqueira',
            documentdescription: 'Manual para regras do uso ...'),
      ],
    );
  }
}
