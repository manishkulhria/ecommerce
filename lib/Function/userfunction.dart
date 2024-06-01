import 'package:ecommerce_ui/Function/Apicollection.dart';
import 'package:ecommerce_ui/model/allmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class api {
  Future<Usermodel> login(String email, String password);
  Future<Usermodel> usersignup(Usermodel model);
}

class UserFunction extends api {
  final _auth = FirebaseAuth.instance;

  @override
  Future<Usermodel> usersignup(Usermodel model) async {
    try {
      final Usercredential = await _auth.createUserWithEmailAndPassword(
          email: model.email!, password: model.password!);

      final userDAta = model.copywith(id: Usercredential.user!.uid);
      Apiclass.documentdata(Usercredential.user!.uid).set(userDAta.tojson());
      // .then(Usercontroller().setuserdata(userDAta)
      // );

      print("kfjgkjkm");
      print(Usercredential);
      return userDAta;
    } catch (e) {
      print(e.toString());
      rethrow;
      // rethrow;
    }
  }

  @override
  Future<Usermodel> login(String email, String password) async {
    try {
      final UserCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // final uid = Usermodel();
      final data = Apiclass.documentdata(UserCredential.user!.uid).get().then(
          (value) => Usermodel.fromojson(
              value.data() as Map<String, dynamic>, value.id));
      return data;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
