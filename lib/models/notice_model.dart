import 'package:flutter/material.dart';

class Notice {
  int? idNotice;
  late String? leftIcon;
  late Color? iconColor;
  late String? title;
  late String? noticedescription;
  late String? startdate;
  late String? enddate;

  Notice({
    this.leftIcon,
    this.iconColor,
    this.title,
    this.noticedescription,
    this.startdate,
    this.enddate,
  });

  Notice.fromJson(Map<String, dynamic> json) {
    idNotice = json['idAvisos'];
    leftIcon = json['icone'];
    title = json['titulo'];
    noticedescription = json['descricao'];
    startdate = json['dataInicio'];
    enddate = json['dataFim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['titulo'] = title;
    data['leftIcon'] = leftIcon.toString();
    data['descricao'] = noticedescription;
    data['dataInicio'] = startdate;
    data['dataFim'] = enddate;
    return data;
  }
}
