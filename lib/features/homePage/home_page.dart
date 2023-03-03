import 'package:flutter/material.dart';
import 'package:moradas/features/homePage/drawer.dart';
import 'botao_navegacao_inferior.dart';
import 'initial_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: const Color(0xff607d8b),
          scaffoldBackgroundColor: const Color.fromARGB(255, 198, 204, 207)),
      home: Scaffold(
        drawer: BotaoMenuEsquerdo(),
        appBar: AppBar(
          title: const Text('Moradas'),
          backgroundColor: const Color(0xFF607D8B),
          centerTitle: true,
        ),
        body: const Initialpage(),
        bottomNavigationBar: const BotaoNavegacaoInferior(),
      ),
    );
  }
}
