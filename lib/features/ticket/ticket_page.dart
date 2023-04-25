import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/features/components/title_card_reserve_widget.dart';
import 'package:moradas/features/components/title_card_ticket_widget.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Criar Ocorrência'),
    Tab(text: 'Minhas Ocorrêcias'),
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
        Container(
          child: Text('Ocorrências'),
        ),
        ListView(
          children: <Widget>[
            TitleCardTicketWidget(
                leftIcon: Icons.not_started,
                iconColor: Color(colorBlueSimple),
                title: 'Ocorrência 1547',
                status: 'Status: Em aberto',
                ticketdescription: 'Breve Descrição: Barulho após o horár...'),
            TitleCardTicketWidget(
                leftIcon: Icons.not_started,
                iconColor: Color(colorBlueSimple),
                title: 'Ocorrência 1991',
                status: 'Status: Em Andamento',
                ticketdescription: 'Breve Descrição: Toneira pingando no ...'),
          ],
        ),
      ]),
    );
  }
}
