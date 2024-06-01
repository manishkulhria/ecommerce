import 'dart:async';

import 'package:ecommerce_ui/classes/class.dart';
import 'package:ecommerce_ui/controller/usercontroller.dart';
import 'package:ecommerce_ui/firebase_options.dart';
import 'package:ecommerce_ui/screen/onboarding/SplachView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

late Mainclassdata Classhandler;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Classhandler = Mainclassdata.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => Usercontroller())
    ], child: MaterialApp(home: Splachview()));
  }
}
