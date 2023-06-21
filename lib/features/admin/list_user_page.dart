import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/features/components/title_card_list_user_widget.dart';

import '../../models/user_model.dart';
import '../services/user_service.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final userService = new UserService();
  List<User> users = [];

  getUsers() async {
    users = await userService.getUsers();

    setState(() {
      this.users = users;
    });
  }

  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Usuários'),
          backgroundColor: Color(colorBlueSimple),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return TitleCardUserWidget(
                name: users[index].fullName!,
                phone: users[index].phone!,
                tower: users[index].tower!,
                apartment: users[index].apartment!);
          },
          // children: [
          //   TitleCardUserWidget(
          //       name: 'Guilherme Lisboa Chaves',
          //       phone: '(41) 98505-3488',
          //       tower: '1',
          //       apartment: '14'),
          //   TitleCardUserWidget(
          //       name: 'Ana Carolina Simião',
          //       phone: 'Telefone: ' + '(41) 98000-000',
          //       tower: 'Torre: ' + '1',
          //       apartment: '14'),
          //   TitleCardUserWidget(
          //       name: 'Francisca Lisboa Chaves',
          //       phone: '(41) 98000-0000',
          //       tower: '2A',
          //       apartment: '443'),
          //   TitleCardUserWidget(
          //       name: 'Celso Lisboa Chaves',
          //       phone: '(41) 98000-0000',
          //       tower: '2B',
          //       apartment: '431'),
          // ],
        ));
  }
}
