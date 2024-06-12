import 'dart:async';
import 'package:ecommerce_ui/classes/class.dart';
import 'package:ecommerce_ui/controller/usercontroller.dart';
import 'package:ecommerce_ui/firebase_options.dart';
import 'package:ecommerce_ui/screen/onboarding/SplachView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'Function/authfunction/Shared_preferences.dart';

late Mainclassdata Classhandler;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Classhandler = Mainclassdata.instance;
  await Sharedpref.sharedpreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Usercontroller())
        ],
        child: GetMaterialApp(
            theme: ThemeData.light(),
            themeMode: ThemeMode.system,
            darkTheme: ThemeData(brightness: Brightness.dark),
            home: Splachview()));
  }
}
