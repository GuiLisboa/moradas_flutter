import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/features/components/title_card_reserve_widget.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({super.key});

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Áreas Comuns'),
    Tab(text: 'Minhas Reservas'),
  ];

  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(colorBlueSimple),
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.amber,
              indicatorWeight: 4,
              padding: EdgeInsets.all(0.1),
              controller: _controller,
              isScrollable: true,
              tabs: tabs,
              onTap: (index) {
                setState(() {
                  _controller.index = index;
                });
              },
            )
          ],
        ),
      ),
      body: TabBarView(controller: _controller, children: [
        ListView(
          children: <Widget>[
            TitleCardReserveWidget(
                leftIcon: Icons.pool,
                iconColor: Color(colorBlueSimple),
                title: 'Piscina',
                usageFee: 'Taxa de Uso: R\$ 50,00',
                capacity: 'Capacidade: 50 pessoas'),
            TitleCardReserveWidget(
                leftIcon: Icons.celebration,
                iconColor: Color(colorBlueSimple),
                title: 'Salão de Festas',
                usageFee: 'Taxa de Uso: R\$ 100,00',
                capacity: 'Capacidade: 100 pessoas'),
            TitleCardReserveWidget(
                leftIcon: Icons.sports_soccer,
                iconColor: Color(colorBlueSimple),
                title: 'Quadra de Futebol',
                usageFee: 'Taxa de Uso: R\$ 50,00',
                capacity: 'Capacidade: 50 pessoas'),
            TitleCardReserveWidget(
                leftIcon: Icons.sports_tennis,
                iconColor: Color(colorBlueSimple),
                title: 'Quadra de Tênis',
                usageFee: 'Taxa de Uso: R\$ 50,00',
                capacity: 'Capacidade: 50 pessoas'),
            TitleCardReserveWidget(
                leftIcon: Icons.sports_basketball,
                iconColor: Color(colorBlueSimple),
                title: 'Quadra de Basquete',
                usageFee: 'Taxa de Uso: R\$ 50,00',
                capacity: 'Capacidade: 50 pessoas'),
            TitleCardReserveWidget(
                leftIcon: Icons.sports_volleyball,
                iconColor: Color(colorBlueSimple),
                title: 'Quadra de Vôlei',
                usageFee: 'Taxa de Uso: R\$ 50,00',
                capacity: 'Capacidade: 50 pessoas'),
            TitleCardReserveWidget(
                leftIcon: Icons.sports_handball,
                iconColor: Color(colorBlueSimple),
                title: 'Quadra de Handebol',
                usageFee: 'Taxa de Uso: R\$ 50,00',
                capacity: 'Capacidade: 50 pessoas'),
            TitleCardReserveWidget(
                leftIcon: Icons.sports_baseball,
                iconColor: Color(colorBlueSimple),
                title: 'Quadra de Futebol de Areia',
                usageFee: 'Taxa de Uso: R\$ 50,00',
                capacity: 'Capacidade: 50 pessoas'),
            TitleCardReserveWidget(
                leftIcon: Icons.sports_cricket,
                iconColor: Color(colorBlueSimple),
                title: 'Quadra de Cricket',
                usageFee: 'Taxa de Uso: R\$ 50,00',
                capacity: 'Capacidade: 50 pessoas'),
            TitleCardReserveWidget(
                leftIcon: Icons.sports_golf,
                iconColor: Color(colorBlueSimple),
                title: 'Quadra de Golf',
                usageFee: 'Taxa de Uso: R\$ 50,00',
                capacity: 'Capacidade: 50 pessoas'),
            TitleCardReserveWidget(
                leftIcon: Icons.sports_mma,
                iconColor: Color(colorBlueSimple),
                title: 'Quadra de MMA',
                usageFee: 'Taxa de Uso: R\$ 50,00',
                capacity: 'Capacidade: 50 pessoas'),
            TitleCardReserveWidget(
                leftIcon: Icons.sports_rugby,
                iconColor: Color(colorBlueSimple),
                title: 'Quadra de Rugby',
                usageFee: 'Taxa de Uso: R\$ 50,00',
                capacity: 'Capacidade: 50 pessoas'),
          ],
        ),
        ListView(
          children: <Widget>[
            TitleCardReserveWidget(
                leftIcon: Icons.pool,
                iconColor: Color(colorBlueSimple),
                title: 'Piscina',
                usageFee: 'Taxa de Uso: R\$ 50,00',
                capacity: 'Capacidade: 50 pessoas'),
            TitleCardReserveWidget(
                leftIcon: Icons.celebration,
                iconColor: Color(colorBlueSimple),
                title: 'Salão de Festas',
                usageFee: 'Taxa de Uso: R\$ 100,00',
                capacity: 'Capacidade: 100 pessoas'),
          ],
        ),
      ]),
    );
  }
}
