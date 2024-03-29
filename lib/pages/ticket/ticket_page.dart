import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/features/components/title_card_list_ticket_widget.dart';
import 'package:moradas/features/controller/ticket_controller.dart';
import 'package:moradas/models/ticket_type_model.dart';
import 'package:moradas/models/user_model.dart';
import 'package:provider/provider.dart';
import '../../models/ticket_model.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Criar Ocorrência'),
    Tab(text: 'Minhas Ocorrências'),
  ];

  Ticket ticket = Ticket();
  List<Ticket> tickets = [];
  List<TicketType> ticketTypes = [];

  late TabController _controller;
  TextEditingController _controllerDate = TextEditingController();
  TextEditingController _controllerTicket = TextEditingController();

  void update() {
    if (globalUserLoged!.isAdmin! == 1) {
      Provider.of<TicketController>(context, listen: false).getTickets();
    } else {
      Provider.of<TicketController>(context, listen: false)
          .getTicketByUserID(globalUserLoged!.idMorador!);
    }
  }

  @override
  void initState() {
    super.initState();
    update();
    _controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ticketController = context.watch<TicketController>();
    tickets = ticketController.tickets;
    ticketTypes = ticketController.ticketTypes;
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
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    TextFormField(
                      controller: _controllerDate,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Selecione a data',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.calendar_month,
                          )),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate:
                                DateTime.now().add(const Duration(days: 365)));
                        if (pickeddate != null) {
                          setState(() {
                            _controllerDate.text =
                                UtilData.obterDataDDMMAAAA(pickeddate);
                            ticket.ocorrenceDate = pickeddate.year.toString() +
                                '-' +
                                pickeddate.month.toString() +
                                '-' +
                                pickeddate.day.toString();
                          });
                        } else {
                          _controllerDate.text =
                              UtilData.obterDataDDMMAAAA(DateTime.now());
                          ticket.ocorrenceDate =
                              DateTime.now().year.toString() +
                                  '-' +
                                  DateTime.now().month.toString() +
                                  '-' +
                                  DateTime.now().day.toString();
                        }
                      },
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
                      controller: _controllerTicket,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Selecione o tipo de Ocorrência',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.more,
                          )),
                      onTap: () {
                        showMaterialScrollPicker(
                          context: context,
                          title: "Selecione o tipo de Ocorrência",
                          items: ticketTypes,
                          selectedItem: ticketTypes[0],
                          onChanged: (value) => setState(() {
                            _controllerTicket.text =
                                value.ticketTypeDescription!;
                            ticket.ticketType = value.idTicketType.toString();
                          }),
                        );
                      },
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
                      onChanged: (text) {
                        ticket.ticketDescription = text;
                      },
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
                              'Descreva o local da Ocorrência ou Unidade',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.home,
                          )),
                      onChanged: (text) {
                        ticket.ticketLocalDescription = text;
                      },
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
              onPressed: () {
                ticket.idMorador = globalUserLoged!.idMorador!;
                ticketController.addNewTicket(context, ticket).then((value) {
                  update();
                });
                setState(() {
                  _controller.index = 1;
                });
              },
            ),
          ],
        ),
        (() {
          if (tickets.isEmpty) {
            return Container(
                margin: EdgeInsets.all(20),
                child: Center(
                    child: Text(
                  'Você ainda não possui ocorrências',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )));
          } else {
            return ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                return TitleCardTicketWidget(
                    ticket: tickets[index],
                    idOcorrencia: tickets[index].idTicket.toString());
              },
            );
          }
        }()),
      ]),
    );
  }
}
