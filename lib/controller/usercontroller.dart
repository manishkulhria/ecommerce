import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_ui/Function/authfunction/Shared_preferences.dart';
import 'package:ecommerce_ui/Function/authfunction/userfunction.dart';
import 'package:ecommerce_ui/model/Apimodel.dart';
import 'package:ecommerce_ui/model/allmodel.dart';
import 'package:ecommerce_ui/screen/home/Homeview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Usercontroller extends ChangeNotifier {
  bool _loading = false;
  dynamic get loading => _loading;
  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // --------------------------------------
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
  Future signUp(Map<String, dynamic> data, BuildContext context) async {
    final Usermodel userdata = Usermodel.fromojson(data["user"]);
    try {
      final usercredential = await _response.authencation(AuthState.SIGNUP,
              json: {"email": userdata.email, "password": data["password"]})
          as UserCredential;
      final String userid = usercredential.user!.uid;
      if (userid.isNotEmpty) {
        await getdata.post(_firestore.collection("user").doc(userid),
            userdata.copywith(id: userid).tojson());

        _user = userdata.copywith(id: userid);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homeview()));
      }
    } catch (e) {
      print("-----------------------");
      print(e.toString());
      print("-----------------------");
    } finally {
      notifyListeners();
    }
  }

  Future Login(Map<String, dynamic> data, BuildContext context) async {
    final Usermodel userdata = Usermodel.fromojson(data["user"]);
    setloading(true);
    try {
      final usercredential = await _response.authencation(AuthState.LOGIN,
              json: {"email": userdata.email, "password": data["password"]})
          as UserCredential;
      final String userid = usercredential.user!.uid;
      if (userid.isNotEmpty) {
        await getdata.get(_firestore.collection("user").doc(userid));
        _user = userdata.copywith(id: userid);
        Sharedpref.setpref(Sharedpref.useridkey, userid);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homeview()));
      }
    } catch (e) {
      print("-------------");
      print(e.toString());
      print("-------------");
    } finally {
      notifyListeners();
      setloading(false);
    }
  }
}
