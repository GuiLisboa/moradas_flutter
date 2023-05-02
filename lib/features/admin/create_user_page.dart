import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
        backgroundColor: Color(colorBlueSimple),
      ),
      body: ListView(children: [
        Container(
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
                          labelText: 'Nome Completo',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.person,
                          ),
                        ),
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
                            labelText: 'Confirmação de senha',
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(
                              Icons.lock,
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
                            labelText: 'Telefone',
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(
                              Icons.phone,
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
                            labelText: 'E-mail',
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(
                              Icons.email,
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
                            labelText: 'Torre',
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(
                              Icons.location_city,
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
                            labelText: 'Apartamento',
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(
                              Icons.apartment,
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
                            labelText: 'Senha',
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(
                              Icons.lock,
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
                            labelText: 'Confirmação de senha',
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(
                              Icons.lock,
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
                child: Text('Salvar'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
