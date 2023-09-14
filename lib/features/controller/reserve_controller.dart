import 'package:flutter/material.dart';
import 'package:moradas/features/services/reserve_service.dart';

import '../../models/reserve_location_model.dart';
import '../../models/reserve_model.dart';
import '../../models/user_model.dart';

class ReserveController extends ChangeNotifier {
  List<ReserveLocation> locationsReserve = [];
  List<Reserve> reserves = [];

  ReserveService reserveService = ReserveService();

  ReserveController() {
    getLocations();
  }

  getLocations() async {
    locationsReserve = await reserveService.getLocations();
    reserves =
        await reserveService.getReserveByUserId(globalUserLoged!.idMorador!);
    notifyListeners();
  }

  getReserveByUserId(int id) async {
    reserves = await reserveService.getReserveByUserId(id);
    notifyListeners();
  }

  addNewReserveLocation(context, ReserveLocation currentReserveLocation) async {
    await reserveService.addNewReserveLocation(context, currentReserveLocation);
    locationsReserve.add(currentReserveLocation);
    notifyListeners();
  }

  disableReserveLocationById(int id, ReserveLocation reserveLocation) async {
    await reserveService.disableReserveLocationById(id);
    locationsReserve.remove(reserveLocation);
    notifyListeners();
  }

  addNewReserve(Reserve currentReserve) async {
    await reserveService.addNewReserve(currentReserve);
    reserves.add(currentReserve);
    notifyListeners();
  }

  deleteReserveById(int id, Reserve reserve) async {
    await reserveService.deleteReserveById(id);
    reserves.remove(reserve);
    notifyListeners();
  }
}
