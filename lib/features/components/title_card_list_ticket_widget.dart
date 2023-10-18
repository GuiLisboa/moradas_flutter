import 'package:flutter/material.dart';
import 'package:moradas/features/controller/ticket_controller.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../models/ticket_model.dart';
import '../../models/user_model.dart';

class TitleCardTicketWidget extends StatelessWidget {
  final IconData leftIcon;
  final Color iconColor;
  Ticket ticket = new Ticket();

  final String idOcorrencia;

  TitleCardTicketWidget({
    super.key,
    this.leftIcon = Icons.not_started,
    this.iconColor = const Color(colorBlueSimple),
    this.idOcorrencia = '',
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    final ticketController = context.watch<TicketController>();

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white54),
      child: ListTile(
        leading: Icon(leftIcon, color: iconColor, size: 30),
        title: Text("Ocorrencia: " + idOcorrencia!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Status: ',
                    style: const TextStyle(
                        fontSize: 18, color: Color(colorBlueSimple))),
                Text(ticket.status!,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(colorBlueSimple),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                Text('Data Abertura: ',
                    style: const TextStyle(
                        fontSize: 18, color: Color(colorBlueSimple))),
                (() {
                  if (ticket.ocorrenceDate!.length > 20) {
                    return Text(
                        (ticket.ocorrenceDate!.substring(8, 10) +
                            "/" +
                            ticket.ocorrenceDate!.substring(5, 7) +
                            "/" +
                            ticket.ocorrenceDate!.substring(0, 4)),
                        style: const TextStyle(
                            fontSize: 18,
                            color: Color(colorBlueSimple),
                            fontWeight: FontWeight.bold));
                  } else {
                    return Text(ticket.ocorrenceDate!,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Color(colorBlueSimple),
                            fontWeight: FontWeight.bold));
                  }
                }()),
              ],
            ),
            Row(
              children: [
                Text(
                    ticket.ticketDescription!.substring(
                            0,
                            ticket.ticketDescription!.length > 20
                                ? 20
                                : ticket.ticketDescription!.length) +
                        "...",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(colorBlueSimple),
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text("Ocorrência: " + idOcorrencia!),
              content: SizedBox(
                width: 300,
                height: 200,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Status: ',
                            style: const TextStyle(
                                fontSize: 18, color: Color(colorBlueSimple))),
                        Text(ticket.status!,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color(colorBlueSimple),
                                fontWeight: FontWeight.bold),
                            softWrap: true),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Tipo de Ocorrência: ',
                            style: const TextStyle(
                                fontSize: 18, color: Color(colorBlueSimple))),
                        Expanded(
                          child: Text(
                            ticket.ticketType!,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color(colorBlueSimple),
                                fontWeight: FontWeight.bold),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Descrição: ',
                            style: const TextStyle(
                                fontSize: 18, color: Color(colorBlueSimple)),
                            softWrap: true),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            ticket.ticketDescription!,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color(colorBlueSimple),
                                fontWeight: FontWeight.bold),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Local Ocorrência: ',
                            style: const TextStyle(
                                fontSize: 18, color: Color(colorBlueSimple)),
                            softWrap: true),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            ticket.ticketLocalDescription!,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color(colorBlueSimple),
                                fontWeight: FontWeight.bold),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Ok'),
                  child: const Text('Ok'),
                ),
              ],
            ),
          );
        },
        trailing: PopupMenuButton(
          color: Color(colorBlueSimple),
          icon: Icon(Icons.more_vert, color: iconColor, size: 30),
          itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              enabled: globalUserLoged!.isAdmin! == 1 ? true : false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Em Andamento",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(Icons.edit_rounded)
                ],
              ),
            ),
            PopupMenuItem<int>(
              value: 1,
              enabled: globalUserLoged!.isAdmin! == 1 ? true : false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fechar",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(Icons.edit_rounded)
                ],
              ),
            ),
            PopupMenuItem<int>(
              value: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Excluir",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(Icons.delete_rounded)
                ],
              ),
            ),
          ],
          onSelected: (item) => {
            if (item == 0)
              {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Em Andamento'),
                    content: const Text(
                        'Tem certeza que deseja colocar sua ocorrência em andamento?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Não'),
                        child: const Text('Não'),
                      ),
                      TextButton(
                        onPressed: () {
                          ticket.status = "2";
                          ticketController
                              .updateTicket(ticket.idTicket, ticket)
                              .then((value) {
                            if (globalUserLoged!.isAdmin == 1) {
                              ticketController.getTickets();
                            } else {
                              ticketController.getTicketByUserID(
                                  globalUserLoged!.idMorador!);
                            }
                            Navigator.pop(context);
                          });
                        },
                        child: const Text('Sim'),
                      ),
                    ],
                  ),
                )
              }
            else if (item == 1)
              {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Fechado'),
                    content: const Text(
                        'Tem certeza que deseja fechar sua ocorrência?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Não'),
                        child: const Text('Não'),
                      ),
                      TextButton(
                        onPressed: () {
                          ticket.status = "3";
                          ticketController
                              .updateTicket(ticket.idTicket, ticket)
                              .then((value) {
                            if (globalUserLoged!.isAdmin == 1) {
                              ticketController.getTickets();
                            } else {
                              ticketController.getTicketByUserID(
                                  globalUserLoged!.idMorador!);
                            }
                            Navigator.pop(context);
                          });
                        },
                        child: const Text('Sim'),
                      ),
                    ],
                  ),
                )
              }
            else if (item == 2)
              {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Excluir Espaço'),
                    content: const Text(
                        'Tem certeza que deseja Excluir este espaço?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Não'),
                        child: const Text('Não'),
                      ),
                      TextButton(
                        onPressed: () {
                          ticketController.deleteTicket(
                              ticket.idTicket!, ticket);
                          Navigator.pop(context);
                        },
                        child: const Text('Sim'),
                      ),
                    ],
                  ),
                )
              }
          },
        ),
      ),
    );
  }
}
