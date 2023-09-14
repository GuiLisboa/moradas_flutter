import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/features/controller/user_controller.dart';
import 'package:moradas/models/user_model.dart';
import 'package:provider/provider.dart';

class TitleCardUserWidget extends StatelessWidget {
  final IconData leftIcon;
  final Color iconColor;
  User user = User();

  final String idMorador;
  final bool isAdmin;

  TitleCardUserWidget({
    super.key,
    this.leftIcon = Icons.people_alt,
    this.iconColor = const Color(colorBlueSimple),
    this.idMorador = '',
    this.isAdmin = false,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final userController = context.watch<UserController>();
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white54),
      child: ListTile(
        leading: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          user.isAdmin! == 1
              ? const CircleAvatar(radius: 19, child: Text('ADM'))
              : Icon(leftIcon, color: iconColor, size: 30)
        ]),
        title: Text(user.fullName!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Telefone: ',
                    style: const TextStyle(
                        fontSize: 18, color: Color(colorBlueSimple))),
                Text(user.phone!,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(colorBlueSimple),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                Text('Torre: ',
                    style: const TextStyle(
                        fontSize: 18, color: Color(colorBlueSimple))),
                Text(user.tower!,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(colorBlueSimple),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                Text('Apartamento: ',
                    style: const TextStyle(
                        fontSize: 18, color: Color(colorBlueSimple))),
                Text(user.apartment!,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(colorBlueSimple),
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton(
            color: Color(colorBlueSimple),
            icon: Icon(Icons.more_vert, color: iconColor, size: 30),
            itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Editar",
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(Icons.edit_rounded)
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Excluir",
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(Icons.delete_rounded)
                      ],
                    ),
                  ),
                ],
            onSelected: (item) => {
                  if (item == 0)
                    {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Editar Usuário'),
                          content: SizedBox(
                            width: double.infinity,
                            height: 450,
                            child: Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  TextFormField(
                                    initialValue: user.fullName,
                                    decoration:
                                        InputDecoration(labelText: 'Nome'),
                                    onChanged: (value) {
                                      user.fullName = value;
                                    },
                                    validator: (value) => value!.isEmpty
                                        ? 'Por favor, insira um nome'
                                        : null,
                                    maxLength: 30,
                                  ),
                                  TextFormField(
                                    initialValue: user.phone,
                                    decoration: const InputDecoration(
                                      labelText: 'Telefone',
                                    ),
                                    onChanged: (value) {
                                      user.phone = value;
                                    },
                                    maxLength: 15,
                                  ),
                                  TextFormField(
                                    initialValue: user.email,
                                    decoration:
                                        InputDecoration(labelText: 'Email'),
                                    onChanged: (value) {
                                      user.email = value;
                                    },
                                    maxLength: 30,
                                  ),
                                  TextFormField(
                                    initialValue: user.tower,
                                    decoration:
                                        InputDecoration(labelText: 'Torre'),
                                    onChanged: (value) {
                                      user.tower = value;
                                    },
                                    maxLength: 30,
                                  ),
                                  TextFormField(
                                    initialValue: user.apartment,
                                    decoration: InputDecoration(
                                        labelText: 'Apartamento'),
                                    onChanged: (value) {
                                      user.apartment = value;
                                    },
                                    maxLength: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'Cancelar');
                              },
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                userController.updateById(
                                    user.idMorador.toString(), user);
                                Navigator.pop(context);
                              },
                              child: const Text('Salvar'),
                            ),
                          ],
                        ),
                      )
                    }
                  else if (item == 1)
                    {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Excluir Cliente'),
                          content: const Text(
                              'Tem certeza que deseja excluir esse cliente?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Não'),
                              child: const Text('Não'),
                            ),
                            TextButton(
                              onPressed: () {
                                userController.deleteById(
                                    user.idMorador.toString(), user);
                                Navigator.pop(context);
                              },
                              child: const Text('Sim'),
                            ),
                          ],
                        ),
                      )
                    }
                }),
      ),
    );
  }
}
