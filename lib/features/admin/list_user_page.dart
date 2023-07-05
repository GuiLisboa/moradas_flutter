import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';

import '../components/title_card_list_user_widget.dart';

import '../../models/user_model.dart';
import '../services/user_service.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({super.key});

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  final userService = new UserService();
  List<User> users = [];

  getUsers() async {
    users = await userService.getUsers();

    setState(() {
      this.users = users;
    });
  }

  @override
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
              user: users[index],
              idMorador: users[index].idMorador!.toString());
        },
      ),
    );
  }
}
