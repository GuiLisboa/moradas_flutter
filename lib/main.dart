import 'package:flutter/material.dart';
import 'package:moradas/reserve/bodyreservescreen.dart';
import 'homepage/bodyhomepage.dart';
import 'homepage/botaonavegacaoinferior.dart';
import 'homepage/drawer.dart';
import 'login/login_screen.dart';
import 'reserve/bodyreservescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/home': (context) => HomePage(),
        '/reserve': (context) => BodyReserveScreen(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(4284513675),
          scaffoldBackgroundColor: Color.fromARGB(255, 198, 204, 207)),
      home: Scaffold(
        drawer: BotaoMenuEsquerdo(),
        appBar: AppBar(
          title: Text('Moradas'),
          backgroundColor: Color(0xFF607D8B),
          centerTitle: true,
        ),
        body: BodyReserveScreen(),
        bottomNavigationBar: BotaoNavegacaoInferior(),
      ),
    );
  }
}
