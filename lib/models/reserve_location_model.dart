import 'package:flutter/material.dart';

class ReserveLocation {
  int? idReserveLocation;
  late String? leftIcon;
  late Color? iconColor;
  late String? title;
  late String? usageFee;
  late String? capacity;
  late bool? isActive;

  ReserveLocation({
    this.leftIcon,
    this.iconColor,
    this.title,
    this.usageFee,
    this.capacity,
    this.isActive = true,
  });

  ReserveLocation.fromJson(Map<String, dynamic> json) {
    idReserveLocation = json['idEspacosComuns'];
    leftIcon = json['icone'];
    title = json['nome'];
    usageFee = json['taxaUso'];
    capacity = json['capacidade'];
    //isActive = json['ativo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['leftIcon'] = leftIcon.toString();
    data['usageFee'] = usageFee;
    data['capacity'] = capacity;
    //data['isActive'] = isActive;
    return data;
  }
}
