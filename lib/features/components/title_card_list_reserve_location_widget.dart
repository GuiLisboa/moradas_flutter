// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/models/user_model.dart';
import 'package:provider/provider.dart';

import '../../models/reserve_location_model.dart';
import '../../models/reserve_model.dart';
import '../controller/reserve_controller.dart';

class TitleCardReserveLocationWidget extends StatelessWidget {
  final IconData leftIcon;
  final Color iconColor;
  ReserveLocation reserveLocation = ReserveLocation();

  TitleCardReserveLocationWidget({
    Key? key,
    this.leftIcon = Icons.people_alt,
    this.iconColor = const Color(colorBlueSimple),
    required this.reserveLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reserveController = context.watch<ReserveController>();

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white54),
      child: ListTile(
          leading:
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              leftIcon,
              color: iconColor,
              size: 30,
            )
          ]),
          title: Text(reserveLocation.title!,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Taxa de uso: ',
                      style: const TextStyle(
                          fontSize: 18, color: Color(colorBlueSimple))),
                  Text('R\$${reserveLocation.usageFee!},00',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color(colorBlueSimple),
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  Text('Capacidade: ',
                      style: const TextStyle(
                          fontSize: 18, color: Color(colorBlueSimple))),
                  Text('${reserveLocation.capacity!} pessoas',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color(colorBlueSimple),
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          trailing: (() {
            if (globalUserLoged!.isAdmin! == 1) {
              return PopupMenuButton(
                color: Color(colorBlueSimple),
                icon: Icon(Icons.more_vert, color: iconColor, size: 30),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Desativar Espaço",
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(Icons.hide_source)
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
                        Icon(Icons.schedule)
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
                          title: const Text('Desativar Espaço'),
                          content: const Text(
                              'Tem certeza que deseja Desativar este espaço?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Não'),
                              child: const Text('Não'),
                            ),
                            TextButton(
                              onPressed: () {
                                reserveController.disableReserveLocationById(
                                    reserveLocation.idReserveLocation!,
                                    reserveLocation);
                                Navigator.pop(context);
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
                          title: const Text('Agendar Espaço'),
                          content: const Text(
                              'Tem certeza que deseja Agendar o Espaço?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Não'),
                              child: const Text('Não'),
                            ),
                            TextButton(
                              onPressed: () {
                                //reserveController.addNewReserve();
                                Navigator.pop(context);
                              },
                              child: const Text('Sim'),
                            ),
                          ],
                        ),
                      )
                    }
                },
              );
            }
          }())),
    );
  }
}
