import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/features/admin/create_documents_page.dart';
import 'package:moradas/features/admin/create_notice_page.dart';
import 'package:moradas/features/admin/create_reserve_page.dart';
import 'package:moradas/features/admin/create_user_page.dart';
import 'package:moradas/features/admin/list_user_page.dart';
import 'package:moradas/models/user_model.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(colorBlueSimple),
            ),
            accountName: Text(globalUserLoged!.fullName!),
            accountEmail: Text(globalUserLoged!.email!),
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/condominio-edificio-bellatrix.jpg'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.my_location),
            title: Text('Condominio Belatrix'),
            subtitle: Text('Bloco: ' +
                globalUserLoged!.tower! +
                ' Apartamento: ' +
                globalUserLoged!.apartment!),
          ),
          (() {
            if (globalUserLoged!.isAdmin == 1) {
              return Column(
                children: [
                  ListTile(
                      leading: Icon(Icons.groups),
                      title: Text('Usuários do Sistema'),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ListUserPage()),
                        );
                      }),
                  ListTile(
                      leading: Icon(Icons.person_add),
                      title: Text('Adicionar Usuário no Sistema'),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => CreateUserPage()),
                        );
                      }),
                  ListTile(
                    leading: Icon(Icons.notification_add),
                    title: Text('Criar Aviso'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => CreateNoticePage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.real_estate_agent),
                    title: Text('Criar Espaço de Área Comum'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => CreateReservePage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.description),
                    title: Text('Criar Documento'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => CreateDocumentsPage()),
                      );
                    },
                  )
                ],
              );
            } else {
              return Container();
            }
          }()),
        ],
      ),
    );
  }
}
