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
                          labelText: 'Título do Aviso.',
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
                          labelText: 'Descrição do Aviso.',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.article,
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
                          labelText: 'Data Inicio do aviso.',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.today,
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
                          labelText: 'Data Fim do aviso.',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.event,
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 24),
                shape: StadiumBorder(),
                backgroundColor: Colors.amber,
              ),
              child: Text('Criar Aviso'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
