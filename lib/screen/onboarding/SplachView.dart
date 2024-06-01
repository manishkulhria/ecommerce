import 'package:ecommerce_ui/resource/constant/Getappimg.dart';
import 'package:ecommerce_ui/screen/onboarding/Sliderview.dart';
import 'package:flutter/material.dart';

class Splachview extends StatefulWidget {
  const Splachview({super.key});

  @override
  State<Splachview> createState() => _SplachviewState();
}

class _SplachviewState extends State<Splachview> {
  @override
  void initState() {
    super.initState();
    splach();
  }

  splach() {
    Future.delayed(
        Duration(seconds: 4),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Sliderview(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    final appimg = Getappimg();
    final appicon = Getappicon();
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(appimg.bg1), fit: BoxFit.cover)),
            child: Center(
                child:
                    Image.asset(appicon.logo, height: 80, color: Colors.white)),
          )
        ],
      ),
    );
  }
}
