import 'package:flutter/material.dart';
import 'package:moradas/features/admin/list_user_page.dart';
import 'package:moradas/features/controller/document_controller.dart';
import 'package:moradas/features/controller/notice_controller.dart';
import 'package:moradas/features/controller/ticket_controller.dart';
import 'package:provider/provider.dart';
import 'features/admin/create_user_page.dart';
import 'features/controller/reserve_controller.dart';
import 'features/controller/user_controller.dart';
import 'pages/homePage/home_page.dart';
import 'pages/login/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ReserveController()),
        ChangeNotifierProvider(create: (context) => UserController()),
        ChangeNotifierProvider(create: (context) => TicketController()),
        ChangeNotifierProvider(create: (create) => NoticeController()),
        ChangeNotifierProvider(create: (create) => DocumentController()),
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
