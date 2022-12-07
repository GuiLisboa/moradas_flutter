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
        centerTitle: true,
      ),
      body: Center(
        child: Text('Hello World'),
      ),
      drawer: BotaoMenuEsquerdo(),
      bottomNavigationBar: BotaoNavegacaoInferior(),
    );
  }
}
