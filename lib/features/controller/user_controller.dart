import 'package:flutter/material.dart';
import 'package:moradas/features/services/user_service.dart';
import '../../models/user_model.dart';

class UserController extends ChangeNotifier {
  List<User> users = [];

  UserService userService = UserService();

  UserController() {
    getUsers();
  }

  getUsers() async {
    users = await userService.getUsers();
    notifyListeners();
  }

  deleteById(String id, User user) async {
    await userService.deleteById(id);
    users.remove(user);
    notifyListeners();
  }

  updateById(String id, User user) async {
    await userService.updateById(id, user);
    notifyListeners();
  }

  addNewUser(context, User currentUser) async {
    await userService.addNewUser(context, currentUser);
    users.add(currentUser);
    notifyListeners();
  }
}
