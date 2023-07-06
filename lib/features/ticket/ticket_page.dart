import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';

import 'package:moradas/features/components/title_card_list_ticket_widget.dart';

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
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      TextFormField(
                        controller: null,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Selecione a data',
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(
                              Icons.calendar_month,
                            )),
                        onEditingComplete: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      TextFormField(
                        controller: null,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Selecione o tipo de Ocorrência',
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(
                              Icons.more,
                            )),
                        onEditingComplete: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      TextFormField(
                        controller: null,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Descreva a Ocorrência',
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(
                              Icons.description,
                            )),
                        onEditingComplete: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      TextFormField(
                        controller: null,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText:
                                'Selecione a Unidade que deseja reportar',
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(
                              Icons.home,
                            )),
                        onEditingComplete: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      TextFormField(
                        controller: null,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Quem deseja notificar',
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(
                              Icons.person,
                            )),
                        onEditingComplete: () {},
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 24),
                  shape: StadiumBorder(),
                  backgroundColor: Colors.amber,
                ),
                child: Text('Criar Ocorrência'),
                onPressed: () {},
              ),
            ],
          ),
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
