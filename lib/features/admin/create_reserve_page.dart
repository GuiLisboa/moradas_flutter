import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';

class CreateReservePage extends StatelessWidget {
  const CreateReservePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Áreas Comuns'),
        backgroundColor: Color(colorBlueSimple),
      ),
      body: Text('CreateReservePage'),
    );
  }
}
