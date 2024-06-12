import 'package:ecommerce_ui/controller/usercontroller.dart';
import 'package:ecommerce_ui/screen/home/editview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Homeview extends StatelessWidget {
  Homeview({super.key});
  final RxString da = "".obs;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Usercontroller>(context);
    final db = provider.apidata;
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Get.defaultDialog(
                cancel: TextButton(
                    onPressed: () {
                      Get.changeThemeMode(ThemeMode.dark);
                    },
                    child: Text("Dark mode")),
                confirm: TextButton(
                    onPressed: () {
                      Get.changeThemeMode(ThemeMode.light);
                    },
                    child: Text("Light mode")),
              );
            },
            icon: Icon(Icons.dark_mode)),
      ]),
      body: ListView(
        children: [
          Center(
            child: Text("Welcome home page"),
          ),
          TextButton(
              onPressed: () async {
                final data = await Get.to(() => Editview(),
                    arguments: {
                      "email": "amit@gmail.com",
                      "password": "12345678"
                    },
                    duration: Duration(seconds: 2),
                    transition: Transition.leftToRightWithFade,
                    fullscreenDialog: true);
                da.value = data["name"];
              },
              child: Text("lockout")),
          Obx(() => da.isNotEmpty ? Text(da.value) : SizedBox()),
        ],
      ),
    );
  }
}
