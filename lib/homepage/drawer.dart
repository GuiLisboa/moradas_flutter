import 'package:flutter/material.dart';

Drawer BotaoMenuEsquerdo() {
  return Drawer(
    child: Column(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text('Guilherme Lisboa Chaves'),
          accountEmail: Text('glc_chaves@hotmail.com'),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.imovelguide.com.br/images/condominio-edificio-bellatrix-ZsHgtn.jpg'),
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
