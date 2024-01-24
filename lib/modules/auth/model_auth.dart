part of "./auth.dart";

class InformasiUserModel {
  String email;
  String password;

  InformasiUserModel({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "password": password,
    };
  }

  factory InformasiUserModel.fromMap(Map<String, dynamic> map) {
    return InformasiUserModel(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());
}
