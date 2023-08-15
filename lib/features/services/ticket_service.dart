import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moradas/features/services/message_service.dart';

import '../../constants.dart';
import '../../models/ticket_model.dart';
import '../../models/ticket_type_model.dart';

class TicketService {
  late FToast fToast;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '$API/ticket/CreateTicket',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  Future addNewTicket(context, Ticket currentTicket) async {
    fToast = FToast();
    fToast.init(context);

    try {
      var url = '$API/ticket/CreateTicket';
      await _dio.post(url, data: currentTicket.toJson());

      MessageService().success("Ticket cadastrado com sucesso!");
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      MessageService().errorFail("Erro ao cadastrar ticket!");
    }
  }

  Future<List<Ticket>> getTickets() async {
    try {
      var url = '$API/ticket/findAll';
      var response = await _dio.get(url);
      print(response.data);

      if (response.statusCode == 200) {
        var tickets = response.data as List;
        return tickets.map((ticket) => Ticket.fromJson(ticket)).toList();
      } else {
        return [];
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      MessageService().errorFail("Erro ao buscar tickets!");
      print(e);
      return [];
    }
  }

  Future<List<TicketType>> getTicketType() async {
    try {
      var url = '$API/ticket/ticketType';
      var response = await _dio.get(url);
      print(response.data);

      if (response.statusCode == 200) {
        var tickets = response.data as List;
        return tickets.map((ticket) => TicketType.fromJson(ticket)).toList();
      } else {
        return [];
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        MessageService().errorTimeOut("Erro ao comunicar com o servidor!");
      }
      MessageService().errorFail("Erro ao buscar tickets!");
      print(e);
      return [];
    }
  }
}
