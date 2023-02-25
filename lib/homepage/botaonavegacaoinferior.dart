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

  static Widget retornarPagina(int index) {
    switch (index) {
      case 0:
        return Text(
          'Index 0: Inicial',
          style: optionStyle,
        );
        break;
      case 1:
        return Text(
          'Index 1: Reservas',
          style: optionStyle,
        );
        break;
      case 2:
        return Text(
          'Index 2: Ocorrencias',
          style: optionStyle,
        );
        break;
      case 3:
        return Text(
          'Index 3: Documentos',
          style: optionStyle,
        );
        break;
      case 4:
        return Text(
          'Index 4: Prestação de Contas',
          style: optionStyle,
        );
        break;
      default:
        return Text(
          'Index 0: Inicial',
          style: optionStyle,
        );
    }
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
        backgroundColor: Color(4284513675),
        onTap: _menuInferiorTapped,
      ),
    );
  }
}
