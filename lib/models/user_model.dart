User? globalUserLoged;

class User {
  int? idMorador;
  late String? fullName;
  late String? cpf;
  late String? phone;
  late String? email;
  late String? tower;
  late String? apartment;
  late String? password;
  int? isAdmin;
  int? isActive;

  User({
    this.idMorador = 0,
    this.fullName,
    this.cpf,
    this.phone,
    this.email,
    this.tower,
    this.apartment,
    this.password,
    this.isAdmin = 0,
    this.isActive = 1,
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
    isAdmin = int.parse(json['isAdmin']);
    isActive = int.parse(json['isActive']);
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
    data['isAdmin'] = isAdmin.toString();
    data['isActive'] = isActive.toString();
    print(data);
    return data;
  }
}
