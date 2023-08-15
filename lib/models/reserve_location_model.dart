import 'package:flutter/material.dart';

class ReserveLocation {
  int? idReserveLocation;
  late String? leftIcon;
  late Color? iconColor;
  late String? title;
  late String? usageFee;
  late String? capacity;
  late int? isActive;

  ReserveLocation({
    this.leftIcon,
    this.iconColor,
    this.title,
    this.usageFee,
    this.capacity,
    this.isActive = 1,
  });

  ReserveLocation.fromJson(Map<String, dynamic> json) {
    idReserveLocation = json['idEspacosComuns'];
    leftIcon = json['icone'];
    title = json['nome'];
    usageFee = json['taxaUso'];
    capacity = json['capacidade'];
    isActive = json['ativo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idReserve'] = idReserveLocation!.toInt();
    data['leftIcon'] = leftIcon.toString();
    data['title'] = title;
    data['usageFee'] = usageFee;
    data['capacity'] = capacity;
    data['isActive'] = isActive;
    return data;
  }
}
