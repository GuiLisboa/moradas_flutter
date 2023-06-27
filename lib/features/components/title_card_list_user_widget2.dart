import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/features/services/user_service.dart';
import 'package:moradas/models/user_model.dart';

class TitleCardUserWidget2 extends StatelessWidget {
  final IconData leftIcon;
  final Color iconColor;
  final String idMorador;
  final String name;
  final String phone;
  final String tower;
  final String apartment;
  final bool isAdmin;

  const TitleCardUserWidget2({
    super.key,
    this.leftIcon = Icons.people_alt,
    this.iconColor = const Color(colorBlueSimple),
    this.idMorador = '',
    required this.name,
    required this.phone,
    required this.tower,
    required this.apartment,
    this.isAdmin = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white54),
      child: ListTile(
        leading: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          isAdmin
              ? CircleAvatar(radius: 25, child: Text('ADM'))
              : Icon(leftIcon, color: iconColor, size: 30)
        ]),
        title: Text(name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Telefone: ',
                    style: const TextStyle(
                        fontSize: 18, color: Color(colorBlueSimple))),
                Text(phone,
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
                Text(tower,
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
                Text(apartment,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(colorBlueSimple),
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        // trailing:
        //     Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //   Icon(Icons.arrow_forward_ios, color: iconColor, size: 30),
        // ]),
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
                            height: 170,
                            child: Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  TextFormField(
                                    initialValue: name,
                                    decoration: InputDecoration(
                                      labelText: 'Nome',
                                    ),
                                    maxLength: 30,
                                  ),
                                  TextFormField(
                                    initialValue: phone,
                                    decoration: const InputDecoration(
                                      labelText: 'Telefone',
                                    ),
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
                                Navigator.pop(context, 'Salvar');
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
                                UserService().deleteById(idMorador);
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
