import 'package:flutter/material.dart';
import 'homepage/botaonavegacaoinferior.dart';
import 'homepage/drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moradas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Moradas'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blueGrey[100],
        child: Stack(
          children: <Widget>[
            Container(
              child: Image.asset('assets/images/background-city.jpg'),
            ),
            Container(
              child: Text(
                'Moradas',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Container(
                  width: 150, child: Image.asset('assets/images/404-logo.jpg')),
            )
          ],
        ),
      ),
      drawer: BotaoMenuEsquerdo(),
      bottomNavigationBar: BotaoNavegacaoInferior(),
    );
  }
}
