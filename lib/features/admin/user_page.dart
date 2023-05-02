import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/features/components/title_card_user_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Usuários'),
          backgroundColor: Color(colorBlueSimple),
        ),
        body: ListView(
          children: [
            TitleCardUserWidget(
                leftIcon: Icons.people_alt,
                iconColor: Color(colorBlueSimple),
                name: 'Guilherme Lisboa Chaves',
                phone: 'Telefone: ' + '(41) 98505-3488',
                tower: 'Torre: ' + '1',
                apartment: 'Apartamento: ' + '14'),
            TitleCardUserWidget(
                leftIcon: Icons.people_alt,
                iconColor: Color(colorBlueSimple),
                name: 'Ana Carolina Sanchez',
                phone: 'Telefone: ' + '(41) 98000-000',
                tower: 'Torre: ' + '1',
                apartment: 'Apartamento: ' + '14'),
            TitleCardUserWidget(
                leftIcon: Icons.people_alt,
                iconColor: Color(colorBlueSimple),
                name: 'Francisca Lisboa Chaves',
                phone: 'Telefone: ' + '(41) 98000-0000',
                tower: 'Torre: ' + '2A',
                apartment: 'Apartamento: ' + '443'),
            TitleCardUserWidget(
                leftIcon: Icons.people_alt,
                iconColor: Color(colorBlueSimple),
                name: 'Celso Lisboa Chaves',
                phone: 'Telefone: ' + '(41) 98000-0000',
                tower: 'Torre: ' + '2B',
                apartment: 'Apartamento: ' + '431'),
          ],
        ));
  }
}
