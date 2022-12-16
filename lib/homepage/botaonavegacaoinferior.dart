import 'package:flutter/material.dart';

class BotaoNavegacaoInferior extends StatefulWidget {
  const BotaoNavegacaoInferior({super.key});

  @override
  State<BotaoNavegacaoInferior> createState() => _BotaoNavegacaoInferiorState();
}

class _BotaoNavegacaoInferiorState extends State<BotaoNavegacaoInferior> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Inicial',
      style: optionStyle,
    ),
    Text(
      'Index 1: Reservas',
      style: optionStyle,
    ),
    Text(
      'Index 2: Ocorrencias',
      style: optionStyle,
    ),
    Text(
      'Index 3: Documentos',
      style: optionStyle,
    ),
    Text(
      'Index 4: Prestação de Contas',
      style: optionStyle,
    ),
  ];

  void _menuInferiorTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicial',
            backgroundColor: Color(4284513675),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.real_estate_agent),
            label: 'Reservas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report_problem),
            label: 'Ocorrecias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Documentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Prestação de Contas',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _menuInferiorTapped,
      ),
    );
  }
}
