class Ticket {
  int? idTicket;
  late String? ocorrenceDate;
  late String? ticketType;
  late String? ticketDescription;
  late String? ticketLocalDescription;
  late String? status;
  late String? createdOn;
  late int? idMorador;

  Ticket({
    this.idTicket = 0,
    this.ocorrenceDate,
    this.ticketType,
    this.ticketDescription,
    this.ticketLocalDescription,
    this.status = "1",
    this.createdOn,
    this.idMorador,
  });

  Ticket.fromJson(Map<String, dynamic> json) {
    idTicket = json['idOcorrencia'];
    ocorrenceDate = json['dataOcorrencia'];
    ticketType = json['tipoOcorrencia'];
    ticketDescription = json['descricaoOcorrencia'];
    ticketLocalDescription = json['localOcorrencia'];
    status = json['statusOcorrencia'];
    createdOn = json['createdOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idTicket'] = idTicket!.toInt();
    data['ocorrenceDate'] = ocorrenceDate;
    data['ticketType'] = ticketType.toString();
    data['ticketDescription'] = ticketDescription;
    data['ticketLocalDescription'] = ticketLocalDescription;
    data['status'] = status.toString();
    //data['createdOn'] = createdOn = createdOn! + " 00:00:00.000";
    data['morador_idMorador'] = idMorador;
    return data;
  }
}
