import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/features/components/drawer_widget.dart';
import 'package:moradas/features/reserve/reserve_page.dart';
import 'package:moradas/features/ticket/ticket_page.dart';

import '../homePage/initial_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Initialpage(),
    ReservePage(),
    TicketPage(),
    const Text('Index 3: Documentos'),
    const Text('Index 4: Prestação de Contas'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: const Color(colorBlueSimple),
          scaffoldBackgroundColor: const Color.fromARGB(255, 198, 204, 207)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Moradas'),
          backgroundColor: const Color(colorBlueSimple),
          centerTitle: true,
        ),
        drawer: const DrawerWidget(),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          //showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Início',
                backgroundColor: Color(colorBlueSimple)),
            BottomNavigationBarItem(
                icon: Icon(Icons.real_estate_agent),
                label: 'Reservas',
                backgroundColor: Color(colorBlueSimple)),
            BottomNavigationBarItem(
                icon: Icon(Icons.report_problem),
                label: 'Ocorrências',
                backgroundColor: Color(colorBlueSimple)),
            BottomNavigationBarItem(
                icon: Icon(Icons.description),
                label: 'Documentos',
                backgroundColor: Color(colorBlueSimple))
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          backgroundColor: const Color(colorBlueSimple),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
