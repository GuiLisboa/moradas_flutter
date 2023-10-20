import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:provider/provider.dart';
import '../components/title_card_list_user_widget.dart';
import '../../models/user_model.dart';
import '../controller/user_controller.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({super.key});

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    Provider.of<UserController>(context, listen: false).getUsers();
  }

  @override
  Widget build(BuildContext context) {
    final userController = context.watch<UserController>();
    users = userController.users;

    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
        backgroundColor: Color(colorBlueSimple),
      ),
      body: (() {
        if (users.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, int index) {
                return TitleCardUserWidget(
                  user: users[index],
                );
              });
        }
      }()),
    );
  }
}
