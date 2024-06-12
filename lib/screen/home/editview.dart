import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Editview extends StatelessWidget {
  const Editview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Get.arguments["email"]),
            TextButton(
                onPressed: () {
                  Get.back(result: {"name": "mansih"});
                },
                child: Text("data"))
          ],
        ),
      ),
    );
  }
}
