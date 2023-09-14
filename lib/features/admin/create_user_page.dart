import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/features/controller/user_controller.dart';

import 'package:moradas/features/services/user_service.dart';
import 'package:provider/provider.dart';
import '../../models/user_model.dart';

class CreateUserPage extends StatefulWidget {
  CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  User user = User();

  final formProduct = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userController = context.watch<UserController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
        backgroundColor: Color(colorBlueSimple),
      ),
      body: Form(
        key: formProduct,
        child: ListView(children: [
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(
                                r"^[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$")),
                          ],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nome Completo',
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(
                              Icons.person,
                            ),
                          ),
                          validator: (val) {
                            if (val!.isEmpty) return 'Campo obrigatório';
                            return null;
                          },
                          onChanged: (text) {
                            user.fullName = text;
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfInputFormatter(),
                          ],
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'CPF',
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(
                                Icons.badge,
                              )),
                          validator: (val) {
                            if (val!.isEmpty) return 'Campo obrigatório';
                            if (val.length < 14) return 'CPF inválido';
                            return null;
                          },
                          onChanged: (text) {
                            user.cpf = text;
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter()
                          ],
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Telefone',
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(
                                Icons.phone,
                              )),
                          validator: (val) {
                            if (val!.isEmpty) return 'Campo obrigatório';
                            if (val.length < 15) return 'Telefone inválido';
                            return null;
                          },
                          onChanged: (text) {
                            user.phone = text;
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'E-mail',
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(
                                Icons.email,
                              )),
                          validator: (val) {
                            if (val!.isEmpty) return 'Campo obrigatório';
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                                .hasMatch(val)) {
                              return 'E-mail inválido';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            user.email = text;
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Torre',
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(
                                Icons.location_city,
                              )),
                          validator: (val) {
                            if (val!.isEmpty) return 'Campo obrigatório';
                            return null;
                          },
                          onChanged: (text) {
                            user.tower = text;
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Apartamento',
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(
                                Icons.apartment,
                              )),
                          validator: (val) {
                            if (val!.isEmpty) return 'Campo obrigatório';
                            return null;
                          },
                          onChanged: (text) {
                            user.apartment = text;
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
                          controller: _pass,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Senha',
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(
                                Icons.lock,
                              )),
                          validator: (val) {
                            if (val!.isEmpty) return 'Campo obrigatório';
                            if (val.length < 6) return 'Senha muito curta';
                            return null;
                          },
                          onChanged: (text) {
                            user.password = text;
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
                          controller: _confirmPass,
                          obscureText: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Confirmação de senha',
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(
                                Icons.lock,
                              )),
                          validator: (val) {
                            if (val!.isEmpty) return 'Campo obrigatório';
                            if (val != _pass.text) return 'Senhas não conferem';
                            return null;
                          },
                          onChanged: (text) {
                            user.password = text;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    child: CheckboxListTile(
                  title: Text("Administrador?"),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: user.isAdmin == 1 ? true : false,
                  onChanged: (newValue) {
                    setState(() {
                      user.isAdmin = newValue! ? 1 : 0;
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
                    userController.addNewUser(context, user);
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
