import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_ui/Function/authfunction/Shared_preferences.dart';
import 'package:ecommerce_ui/screen/onboarding/welcomeview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum AuthState { LOGIN, SIGNUP }

abstract class api {
  Future<dynamic> authencation(AuthState type, {Map<String, dynamic> json});
  Future<dynamic> get(path);
  Future<dynamic> post(path, Map<String, dynamic> data);
}

final _auth = FirebaseAuth.instance;

class UserFunction extends api {
  final _auth = FirebaseAuth.instance;

  @override
  Future authencation(AuthState type, {Map<String, dynamic>? json}) async {
    final String email = json!["email"];
    final String password = json["password"];
    try {
      if (type == AuthState.SIGNUP) {
        return await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      } else {
        return await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future get(path) async {
    try {
      if (path is CollectionReference) {
        return await path.get();
      } else if (path is DocumentReference) {
        return await path.get();
      } else if (path is String) {
        return await http.get(Uri.parse(path));
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future post(path, Map<String, dynamic> data) async {
    try {
      if (path is CollectionReference) {
        return await path.add(data);
      } else if (path is DocumentReference) {
        return await path.set(data);
      } else if (path is String) {
        return await http.post(Uri.parse(data["uri"]), body: data);
      }
    } catch (e) {
      rethrow;
    }
  }
}

logOut(BuildContext context) {
  _auth.signOut().then((value) => Sharedpref.removepref(Sharedpref.useridkey));
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => Welcomeview()), (route) => false);
}
