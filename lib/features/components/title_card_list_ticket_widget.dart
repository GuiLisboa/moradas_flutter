import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/ticket_model.dart';

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
                Text(
                    (ticket.ocorrenceDate!.substring(8, 10) +
                        "/" +
                        ticket.ocorrenceDate!.substring(5, 7) +
                        "/" +
                        ticket.ocorrenceDate!.substring(0, 4)),
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(colorBlueSimple),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                // Text('Descrição: ',
                //     style: const TextStyle(
                //         fontSize: 18, color: Color(colorBlueSimple))),
                Text(ticket.ticketDescription!.substring(0, 20) + "...",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(colorBlueSimple),
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton(
          color: Color(colorBlueSimple),
          icon: Icon(Icons.more_vert, color: iconColor, size: 30),
          itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Editar",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(Icons.edit_rounded)
                ],
              ),
            ),
            PopupMenuItem<int>(
              value: 1,
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
        ),
      ),
    );
  }
}
