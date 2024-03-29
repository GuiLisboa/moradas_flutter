import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/models/user_model.dart';
import 'package:provider/provider.dart';
import '../../models/datetimereserve_model.dart';
import '../../models/rent_model.dart';
import '../../models/reserve_location_model.dart';
import '../../models/reserve_model.dart';
import '../controller/reserve_controller.dart';

class TitleCardReserveLocationWidget extends StatelessWidget {
  final IconData leftIcon;
  final Color iconColor;
  ReserveLocation reserveLocation = ReserveLocation();
  Reserve reserve = Reserve();
  Rent rent = Rent();

  List<DateTimeReserve> dates = [];

  TitleCardReserveLocationWidget({
    Key? key,
    this.leftIcon = Icons.settings_accessibility,
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
        leading: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            leftIcon,
            color: iconColor,
            size: 30,
          )
        ]),
        title: Text(reserveLocation.title!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
        trailing: PopupMenuButton(
          color: Color(colorBlueSimple),
          icon: Icon(Icons.more_vert, color: iconColor, size: 30),
          itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              enabled: globalUserLoged!.isAdmin! == 1 ? true : false,
              child: const Row(
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
            const PopupMenuItem<int>(
              value: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Agendar Espaço",
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
                reserveController
                    .getDateReserves(reserveLocation.idReserveLocation!),
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Agendar Espaço'),
                    content:
                        const Text('Tem certeza que deseja Agendar o Espaço?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Não'),
                        child: const Text('Não'),
                      ),
                      TextButton(
                        onPressed: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              selectableDayPredicate: (DateTime val) =>
                                  reserveController.dates.any((element) =>
                                          element.date!.day == val.day &&
                                          element.date!.month == val.month &&
                                          element.date!.year == val.year)
                                      ? false
                                      : true,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now()
                                  .add(const Duration(days: 365)));

                          if (pickeddate != null) {
                            rent.idMorador = globalUserLoged!.idMorador;
                            rent.idReserveLocation =
                                reserveLocation.idReserveLocation;
                            rent.dateRent = pickeddate.toString();
                            reserve.title = reserveLocation.title;
                            reserve.usageFee = reserveLocation.usageFee;
                            reserve.capacity = reserveLocation.capacity;
                            reserve.dateReserve = pickeddate.toString();
                            reserveController.addNewReserve(rent, reserve);
                            Navigator.pop(context);
                          } else {
                            Navigator.pop(context);
                          }
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
