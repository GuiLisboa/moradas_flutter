import 'package:flutter/material.dart';
import 'package:moradas/features/admin/list_user_page.dart';
import 'package:moradas/features/services/user_service.dart';
import 'package:provider/provider.dart';

import 'features/admin/create_user_page.dart';
import 'features/homePage/home_page.dart';
import 'features/login/login_page.dart';
import 'features/services/reserve_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ReserveService()),
        ChangeNotifierProvider(create: (_) => UserService()),
      ],
      child: MaterialApp(
        title: 'Moradas',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginPage(),
          '/home': (context) => const HomePage(),
          '/listUser': (context) => const ListUserPage(),
          '/createUser': (context) => CreateUserPage(),
        },
      ),
    );
  }
}
