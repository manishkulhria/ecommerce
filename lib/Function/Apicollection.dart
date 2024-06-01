import 'package:cloud_firestore/cloud_firestore.dart';

class Apiclass {
  static final _firebasestore = FirebaseFirestore.instance;
static  CollectionReference datacollection = _firebasestore.collection("user");
 static DocumentReference documentdata(String id) => datacollection.doc(id);
}
