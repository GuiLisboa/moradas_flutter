import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';

class CreateNoticePage extends StatelessWidget {
  const CreateNoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Avisos'),
        backgroundColor: Color(colorBlueSimple),
      ),
      body: Text('CreateNoticePage'),
    );
  }
}
