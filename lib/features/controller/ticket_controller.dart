import 'package:flutter/material.dart';
import 'package:moradas/features/services/ticket_service.dart';
import 'package:moradas/models/ticket_model.dart';
import 'package:moradas/models/ticket_type_model.dart';
import 'package:moradas/models/user_model.dart';

class TicketController extends ChangeNotifier {
  List<Ticket> tickets = [];
  List<TicketType> ticketTypes = [];

  TicketService ticketService = TicketService();

  TicketController() {
    getTicketByUserID(globalUserLoged!.idMorador!);
  }

  addNewTicket(context, Ticket currentTicket) async {
    await ticketService.addNewTicket(context, currentTicket);
    tickets.add(currentTicket);
    notifyListeners();
  }

  getTickets() async {
    tickets = await ticketService.getTickets();
    ticketTypes = await ticketService.getTicketType();
    notifyListeners();
  }

  getTicketByUserID(int idMorador) async {
    tickets = await ticketService.getTicketByUserID(idMorador);
    ticketTypes = await ticketService.getTicketType();
    notifyListeners();
  }

  updateTicket(idTicket, Ticket currentTicket) async {
    await ticketService.updateTicket(idTicket, currentTicket);
    notifyListeners();
  }

  deleteTicket(int idTicket, Ticket currentTicket) async {
    await ticketService.deleteTicket(idTicket);
    tickets.remove(currentTicket);
    notifyListeners();
  }
}
