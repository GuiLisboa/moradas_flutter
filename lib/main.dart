import 'package:flutter/material.dart';
import 'features/homePage/home_page.dart';
import 'features/login/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moradas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => const HomePage(),
        '/reserve': (context) => const BodyReserveScreen(),
      },
    );
  }
}
