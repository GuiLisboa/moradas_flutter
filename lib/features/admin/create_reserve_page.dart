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
                          labelText: 'Título da Área Comum.',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.description,
                          )),
                      onEditingComplete: () {},
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
                          labelText: 'Taxa de Uso.',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.attach_money,
                          )),
                      onEditingComplete: () {},
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
                          labelText: 'Capacidade da Área Comum.',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.emoji_people,
                          )),
                      onEditingComplete: () {},
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
                          labelText: 'Escolha um Ícone.',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.add_reaction,
                          )),
                      onEditingComplete: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
