import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';

import 'package:provider/provider.dart';

import '../../models/reserve_location_model.dart';
import '../../models/reserve_model.dart';
import '../components/title_card_list_reserve_location_widget.dart';
import '../components/title_card_list_reserve_widget.dart';
import '../controller/reserve_controller.dart';

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

  List<ReserveLocation> locationsReserve = [];
  List<Reserve> reserves = [];

  @override
  void initState() {
    super.initState();
    Provider.of<ReserveController>(context, listen: false).getLocations();
    _controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reserveController = context.watch<ReserveController>();
    locationsReserve = reserveController.locationsReserve;
    reserves = reserveController.reserves;
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
        ListView.builder(
          itemCount: locationsReserve.length,
          itemBuilder: (context, index) {
            return TitleCardReserveLocationWidget(
                reserveLocation: locationsReserve[index]);
          },
        ),
        (() {
          if (reserves.length == 0) {
            return Container(
                margin: EdgeInsets.all(20),
                child: Center(
                    child: Text(
                  'Você ainda não possui reservas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )));
          } else {
            return ListView.builder(
              itemCount: reserves.length,
              itemBuilder: (context, index) {
                return TitleCardReserveWidget(reserve: reserves[index]);
              },
            );
          }
        }()),
      ]),
    );
  }
}
