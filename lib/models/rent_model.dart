class Rent {
  int? idRent;
  late int? idMorador;
  late int? idReserveLocation;
  late String? dateRent;

  Rent({
    this.idRent,
    this.idMorador,
    this.idReserveLocation,
    this.dateRent,
  });

  // Rent.fromJson(Map<String, dynamic> json) {
  //   idRent = json['idReserva'];
  //   idMorador = json['idMorador'];
  //   idReserveLocation = json['idEspacosComuns'];
  //   dateRent = json['dataLocacao'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idMorador'] = idMorador!.toInt();
    data['idEspacosComuns'] = idReserveLocation!.toInt();
    data['dataLocacao'] = dateRent;
    return data;
  }
}
