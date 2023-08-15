class TicketType {
  int? idTicketType;
  late String? ticketTypeDescription;

  @override
  String toString() => ticketTypeDescription!;

  TicketType({
    this.idTicketType = 0,
    this.ticketTypeDescription,
  });

  TicketType.fromJson(Map<String, dynamic> json) {
    idTicketType = json['idTipoOcorrencia'];
    ticketTypeDescription = json['tipoOcorrencia'];
  }
}
