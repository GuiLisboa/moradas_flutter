import 'package:flutter/material.dart';

Drawer BotaoMenuEsquerdo() {
  return Drawer(
    child: Column(
      children: [
        UserAccountsDrawerHeader(
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
