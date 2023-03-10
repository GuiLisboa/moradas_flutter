import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';

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
            accountName: Text('Guilherme Lisboa Chaves'),
            accountEmail: Text('glc_chaves@hotmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/condominio-edificio-bellatrix.jpg'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.my_location),
            title: Text('Condominio Belatrix'),
            subtitle: Text('Bloco: 1 Apartamento 14'),
          ),
        ],
      ),
    );
  }
}
