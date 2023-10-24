import 'package:flutter/material.dart';

class Reserve {
  int? idReserve;
  late String? leftIcon;
  late Color? iconColor;
  late String? title;
  late String? usageFee;
  late String? capacity;
  late String? dateReserve;
  String? nameUser;
  String? towerUser;
  String? apartmentUser;

  Reserve({
    this.leftIcon,
    this.iconColor,
    this.title,
    this.usageFee,
    this.capacity,
    this.dateReserve,
    this.nameUser = '0',
    this.towerUser = '0',
    this.apartmentUser = '0',
  });

  Reserve.fromJson(Map<String, dynamic> json) {
    idReserve = json['idreserva'];
    leftIcon = json['icone'];
    title = json['nome'];
    usageFee = json['taxaUso'];
    capacity = json['capacidade'];
    dateReserve = json['dataLocacao'];
    nameUser = json['fullName'];
    towerUser = json['tower'];
    apartmentUser = json['apartment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idReserve'] = idReserve!.toInt();
    data['leftIcon'] = leftIcon.toString();
    data['title'] = title;
    data['usageFee'] = usageFee;
    data['capacity'] = capacity;
    data['dateReserve'] = dateReserve;
    return data;
  }
}
