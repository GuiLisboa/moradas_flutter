import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/features/services/reserve_service.dart';
import 'package:moradas/models/reserve_location_model.dart';

class CreateReservePage extends StatefulWidget {
  const CreateReservePage({super.key});

  @override
  State<CreateReservePage> createState() => _CreateReservePageState();
}

class _CreateReservePageState extends State<CreateReservePage> {
  ReserveLocation reserveLocation = ReserveLocation();

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
                      maxLength: 15,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Título da Área Comum.',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.description,
                          )),
                      onChanged: (text) {
                        reserveLocation.title = text;
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
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Taxa de Uso.',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.attach_money,
                          )),
                      onChanged: (text) {
                        reserveLocation.usageFee = text;
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
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Capacidade da Área Comum.',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.emoji_people,
                          )),
                      onChanged: (text) {
                        reserveLocation.capacity = text;
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.all(15),
            //   child: SizedBox(
            //     child: Flex(
            //       direction: Axis.vertical,
            //       children: [
            //         TextFormField(
            //           controller: null,
            //           decoration: const InputDecoration(
            //               border: OutlineInputBorder(),
            //               labelText: 'Escolha um Ícone.',
            //               fillColor: Colors.white,
            //               filled: true,
            //               suffixIcon: Icon(
            //                 Icons.add_reaction,
            //               )),
            //           onChanged: (text) {
            //             reserveLocation.leftIcon = text;
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Container(
                child: CheckboxListTile(
              title: Text("Ativo?"),
              controlAffinity: ListTileControlAffinity.leading,
              value: reserveLocation.isActive,
              onChanged: (newValue) {
                setState(() {
                  reserveLocation.isActive = newValue;
                });
              },
              activeColor: Colors.green,
            )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 24),
                shape: StadiumBorder(),
                backgroundColor: Colors.amber,
              ),
              child: Text('Salvar'),
              onPressed: () {
                ReserveService()
                    .addNewReserveLocation(context, reserveLocation);
              },
            ),
          ],
        ),
      ),
    );
  }
}
