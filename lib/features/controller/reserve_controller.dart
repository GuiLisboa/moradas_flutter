import 'package:flutter/material.dart';
import 'package:moradas/features/services/reserve_service.dart';
import 'package:moradas/models/rent_model.dart';
import '../../models/datetimereserve_model.dart';
import '../../models/reserve_location_model.dart';
import '../../models/reserve_model.dart';
import '../../models/user_model.dart';

class ReserveController extends ChangeNotifier {
  List<ReserveLocation> locationsReserve = [];
  List<Reserve> reserves = [];
  List<DateTimeReserve> dates = [];

  ReserveService reserveService = ReserveService();

  ReserveController() {
    getLocations();
  }

  getLocations() async {
    locationsReserve = await reserveService.getLocations();
    notifyListeners();
    if (globalUserLoged!.isAdmin == 1) {
      reserves = await reserveService.getReserves();
      notifyListeners();
    } else {
      reserves =
          await reserveService.getReserveByUserId(globalUserLoged!.idMorador!);
      notifyListeners();
    }
  }

  getAllReserves() async {
    reserves = await reserveService.getReserves();
    notifyListeners();
  }

  getReserveByUserId(int id) async {
    reserves = await reserveService.getReserveByUserId(id);
    notifyListeners();
  }

  getDateReserves(int idLocation) async {
    dates = await reserveService.getDateReserves(idLocation);
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

  addNewReserve(Rent rent, Reserve reserve) async {
    await reserveService.addNewReserve(rent);
    reserves.add(reserve);
    notifyListeners();
  }

  deleteReserveById(int id, Reserve reserve) async {
    await reserveService.deleteReserveById(id);
    reserves.remove(reserve);
    notifyListeners();
  }
}
