import 'package:flutter/material.dart';
import 'package:moradas/custom_navigator_observer.dart';
import 'package:moradas/features/admin/list_user_page.dart';
import 'package:moradas/features/services/user_service.dart';
import 'package:provider/provider.dart';

import 'features/homePage/home_page.dart';
import 'features/login/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final navigatorObserver = CustomNavigatorObserver();

    return MaterialApp(
      title: 'Moradas',
      //navigatorObservers: [navigatorObserver],
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/listUser': (context) => const ListUserPage()
      },
    );
  }
}
