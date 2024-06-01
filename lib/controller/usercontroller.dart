import 'package:ecommerce_ui/model/allmodel.dart';
import 'package:flutter/material.dart';

class Usercontroller extends ChangeNotifier {
  dynamic _user;
  Usermodel get userdata => _user;
  setuserdata(Usermodel model) {
    model = userdata;
    notifyListeners();
  }
}
