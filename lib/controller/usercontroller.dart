import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_ui/Function/authfunction/userfunction.dart';
import 'package:ecommerce_ui/model/Apimodel.dart';
import 'package:ecommerce_ui/model/allmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Usercontroller extends ChangeNotifier {
  final _response = UserFunction();
  final _firestore = FirebaseFirestore.instance;
  dynamic _user;
  Usermodel get userdata => _user;
  setuserdata(Usermodel model) {
    _user = model;
    notifyListeners();
  }

  List<usermodeldata> _usercontroller = [];
  List<usermodeldata> get apidata => _usercontroller;
  setapidata(List<usermodeldata> model) {
    _usercontroller = model;

    notifyListeners();
  }

  //  SIGNUP
  final getdata = UserFunction();
  Future signUp(Map<String, dynamic> data) async {
    try {
      final Usermodel userdata = Usermodel.fromojson(data);
      final usercredential = _response.authencation(AuthState.SIGNUP,
              json: {"email": userdata.email, "password": data["password"]})
          as UserCredential;
      final String userid = usercredential.user!.uid;
      if (userid.isNotEmpty) {
        await getdata.post(_firestore.collection("user").doc(userid), data);

        _user = userdata.copywith(id: userid);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      notifyListeners();
    }
  }
}
