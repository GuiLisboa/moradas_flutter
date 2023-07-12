import 'package:flutter/material.dart';
import 'package:moradas/models/user_model.dart';

class Ticket {
  int? idTicket;
  late String? ocorrenceDate;
  late int? ticketType;
  late String? ticketDescription;
  late String? ticketLocalDescription;
  late String? status;
  late DateTime? createdOn;
  // late User user;

  Ticket({
    this.idTicket = 0,
    this.ocorrenceDate,
    this.ticketType,
    this.ticketDescription,
    this.ticketLocalDescription,
    this.status,
    this.createdOn,
    // this.user.idMorador,
  });

  Ticket.fromJson(Map<String, dynamic> json) {
    idTicket = json['idTicket'];
    ocorrenceDate = json['ocorrenceDate'];
    ticketType = json['ticketType'];
    ticketDescription = json['ticketDescription'];
    ticketLocalDescription = json['ticketLocalDescription'];
    status = json['status'];
    createdOn = json['createdOn'];
    // user.idMorador = json['user.idMorador'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idTicket'] = idTicket!.toInt();
    data['ocorrenceDate'] = ocorrenceDate;
    data['ticketType'] = ticketType;
    data['ticketDescription'] = ticketDescription;
    data['ticketLocalDescription'] = ticketLocalDescription;
    data['status'] = status;
    data['createdOn'] = createdOn;
    return data;
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'idTicket': idTicket,
  //     'ocorrenceDate': ocorrenceDate,
  //     'ticketType': ticketType,
  //     'ticketDescription': ticketDescription,
  //     'ticketLocalDescription': ticketLocalDescription,
  //     'status': status,
  //     'createdOn': createdOn
  //   };
  // }
}
