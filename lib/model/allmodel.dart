import 'package:firebase_auth/firebase_auth.dart';

class Usermodel {
  String? id;
  String? email;
  String? name;
  String? password;
  Usermodel({this.id, this.name, this.email, this.password});

  Map<String, dynamic> tojson() {
    return {"id": id, "name": name, "email": email, "password": password};
  }

  Usermodel copywith(
      {String? id, String? name, String? email, String? password}) {
    return Usermodel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  Usermodel.fromojson(Map<String, dynamic> json, this.id)
      : email = json["email"],
        password = json["password"];
}
