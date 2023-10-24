class DateTimeReserve {
  late DateTime? date;

  DateTimeReserve({
    this.date,
  });

  DateTimeReserve.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['dataLocacao']);
  }
}
