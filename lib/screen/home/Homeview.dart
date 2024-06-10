import 'package:ecommerce_ui/Function/authfunction/userfunction.dart';
import 'package:ecommerce_ui/controller/usercontroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Usercontroller>(context);
    final db = provider.apidata;
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Text("Welcome home page"),
          ),
          TextButton(
              onPressed: () {
                logOut(context);
              },
              child: Text("lockout")),
          ListView.builder(
            itemCount: db.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => ListTile(
              title: Text(db[index].title.toString()),
              subtitle: Text(db[index].price.toString()),
            ),
          )
        ],
      ),
    );
  }
}
