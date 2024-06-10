import 'package:cloud_firestore/cloud_firestore.dart';

class Apiclass {
  static final _firebasestore = FirebaseFirestore.instance;
  // COLLECTION REFERENCE
  static CollectionReference datacollection = _firebasestore.collection("user");

  // DOCUMENT REFERENCE
  static DocumentReference documentdata(String id) => datacollection.doc(id);
}
