// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/models/reserve_model.dart';
import 'package:provider/provider.dart';
import '../controller/reserve_controller.dart';

class TitleCardReserveWidget extends StatelessWidget {
  final IconData leftIcon;
  final Color iconColor;
  Reserve reserve = Reserve();

  TitleCardReserveWidget({
    super.key,
    this.leftIcon = Icons.people_alt,
    this.iconColor = const Color(colorBlueSimple),
    required this.reserve,
  });

  @override
  Widget build(BuildContext context) {
    final reserverController = context.watch<ReserveController>(); // Provider

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white54),
      child: ListTile(
        leading: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            leftIcon,
            color: iconColor,
            size: 30,
          )
        ]),
        title: Text(reserve.title!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Taxa de uso: ',
                    style: const TextStyle(
                        fontSize: 18, color: Color(colorBlueSimple))),
                Text('R\$${reserve.usageFee!},00',
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
                Text('${reserve.capacity!} pessoas',
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(colorBlueSimple),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                Text('Data reserva: ',
                    style: const TextStyle(
                        fontSize: 18, color: Color(colorBlueSimple))),
                Text(
                    (reserve.dateReserve!.substring(8, 10) +
                        "/" +
                        reserve.dateReserve!.substring(5, 7) +
                        "/" +
                        reserve.dateReserve!.substring(0, 4)),
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
              title: const Text('Reserva'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("Nome: " + reserve.nameUser!),
                    Text("Bloco: " + reserve.towerUser!),
                    Text("Apartamento: " + reserve.apartmentUser!),
                  ],
                ),
              ),
              actions: <Widget>[
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(Icons.cancel)
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
                    title: const Text('Cancelar'),
                    content: const Text(
                        'Tem certeza que deseja cancelar esta reserva?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Não'),
                        child: const Text('Não'),
                      ),
                      TextButton(
                        onPressed: () {
                          reserverController.deleteReserveById(
                              reserve.idReserve!, reserve);
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
