class User {
  int? idMorador;
  late String? fullName;
  late String? cpf;
  late String? phone;
  late String? email;
  late String? tower;
  late String? apartment;
  late String? password;
  // late DateTime? createdOn;
  bool? isAdmin;
  bool? isActive;

  User({
    this.idMorador = 0,
    this.fullName,
    this.cpf,
    this.phone,
    this.email,
    this.tower,
    this.apartment,
    this.password,
    // this.createdOn,
    this.isAdmin = false,
    this.isActive = true,
  });

  User.fromJson(Map<String, dynamic> json) {
    idMorador = json['idMorador'];
    fullName = json['fullName'];
    cpf = json['cpf'];
    phone = json['phone'];
    email = json['email'];
    tower = json['tower'];
    apartment = json['apartment'];
    password = json['password'];
    //createdOn = json['createdOn'];
    // isAdmin = json['isAdmin'] ?? true;
    // isActive = json['isActive'] ?? true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idMorador'] = idMorador!.toInt();
    data['fullName'] = fullName;
    data['cpf'] = cpf;
    data['phone'] = phone;
    data['email'] = email;
    data['tower'] = tower;
    data['apartment'] = apartment;
    data['password'] = password;
    // data['createdOn'] = createdOn;
    // data['isAdmin'] = isAdmin;
    // data['isActive'] = isActive;
    return data;
  }
}
