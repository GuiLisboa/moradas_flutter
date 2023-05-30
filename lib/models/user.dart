class User {
  final String fullName;
  final String cpf;
  final String phone;
  final String email;
  final String tower;
  final String apartment;
  final String password;
  final DateTime createdOn;
  bool isAdmin;
  bool isActive;

  User({
    required this.fullName,
    required this.cpf,
    required this.phone,
    required this.email,
    required this.tower,
    required this.apartment,
    required this.password,
    required this.createdOn,
    this.isAdmin = false,
    this.isActive = true,
  });
}
