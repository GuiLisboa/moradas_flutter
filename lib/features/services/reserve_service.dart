import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moradas/models/reserve_location_model.dart';
import 'package:moradas/models/reserve_model.dart';
import '../../constants.dart';
import '../../models/datetimereserve_model.dart';
import '../../models/rent_model.dart';
import 'message_service.dart';

class ReserveService {
  late FToast fToast;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '$API/reserve/CreateReserve',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  Future<List<ReserveLocation>> getLocations() async {
    try {
      var url = '$API/reserve/findAllLocation';
      var response = await _dio.get(url);
      print(response.data);

      if (response.statusCode == 200) {
        var reserves = response.data as List;
        return reserves
            .map((reserve) => ReserveLocation.fromJson(reserve))
            .toList();
      } else {
        return [];
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      MessageService().errorFail("Erro ao buscar espaços!");
      print(e);
      return [];
    }
  }

  Future<List<Reserve>> getReserves() async {
    try {
      var url = '$API/reserve/findAllReserves';
      var response = await _dio.get(url);
      print(response.data);

      if (response.statusCode == 200) {
        var reserves = response.data as List;
        return reserves.map((reserve) => Reserve.fromJson(reserve)).toList();
      } else {
        return [];
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      MessageService().errorFail("Erro ao buscar espaços!");
      print(e);
      return [];
    }
  }

  Future<List<Reserve>> getReserveByUserId(int id) async {
    try {
      var url = '$API/reserve/findReserveByUserId/$id';
      var response = await _dio.get(url);
      print(response.data);

      if (response.statusCode == 200) {
        var reserves = response.data as List;
        return reserves.map((reserve) => Reserve.fromJson(reserve)).toList();
      } else {
        return [];
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      MessageService().errorFail("Erro ao buscar reservas!");
      print(e);
      return [];
    }
  }

  Future<List<DateTimeReserve>> getDateReserves(int idLocation) async {
    try {
      var url = '$API/reserve/findAllDateReserve/$idLocation';
      var response = await _dio.get(url);
      print(response.data);

      if (response.statusCode == 200) {
        var dates = response.data as List;
        return dates.map((dates) => DateTimeReserve.fromJson(dates)).toList();
      } else {
        return [];
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      MessageService().errorFail("Erro ao buscar espaços!");
      print(e);
      return [];
    }
  }

  Future addNewReserveLocation(context, ReserveLocation reserveLocation) async {
    fToast = FToast();
    fToast.init(context);

    try {
      var url = '$API/reserve/createNewReserveLocation';
      await _dio.post(url, data: reserveLocation.toJson());

      MessageService().success("Espaço cadastrado com sucesso!");

      Navigator.of(context).pop();
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      MessageService().errorFail("Erro ao cadastrar espaço!");
    }
  }

  Future disableReserveLocationById(int id) async {
    try {
      var url = '$API/reserve/disableReserveLocationById/$id';
      await _dio.put(url);

      MessageService().success("Espaço desativado com sucesso!");
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      print(e);
    }
  }

  Future addNewReserve(Rent rent) async {
    fToast = FToast();

    try {
      var url = '$API/rent/createNewRent';
      await _dio.post(url, data: rent.toJson());

      MessageService().success("Reserva cadastrada com sucesso!");
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      MessageService().errorFail("Erro ao cadastrar reserva!");
    }
  }

  Future deleteReserveById(int id) async {
    try {
      var url = '$API/reserve/deleteReserveById/$id';
      await _dio.delete(url);

      MessageService().success("Reserva excluida com sucesso!");
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      print(e);
    }
  }
}
