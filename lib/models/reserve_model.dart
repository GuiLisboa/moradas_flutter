import 'package:flutter/material.dart';

class Reserve {
  int? idReserve;
  late String? leftIcon;
  late Color? iconColor;
  late String? title;
  late String? usageFee;
  late String? capacity;
  late String? dateReserve;

  Reserve({
    this.leftIcon,
    this.iconColor,
    this.title,
    this.usageFee,
    this.capacity,
    this.dateReserve,
  });

  Reserve.fromJson(Map<String, dynamic> json) {
    idReserve = json['idreserva'];
    leftIcon = json['icone'];
    title = json['nome'];
    usageFee = json['taxaUso'];
    capacity = json['capacidade'];
    dateReserve = json['dataLocacao'];
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
