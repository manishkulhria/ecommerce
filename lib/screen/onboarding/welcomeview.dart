import 'package:ecommerce_ui/components/Btnwidget/Perimerybtn.dart';
import 'package:ecommerce_ui/main.dart';
import 'package:ecommerce_ui/resource/constant/Getappimg.dart';
import 'package:ecommerce_ui/screen/auth/Loginview.dart';
import 'package:ecommerce_ui/screen/auth/signupview.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Welcomeview extends StatelessWidget {
  const Welcomeview({super.key});

  @override
  Widget build(BuildContext context) {
    final appimg = Getappimg();
    final appicon = Getappicon();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(appimg.bg2), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            Expanded(
              child: Center(
                  child: Image.asset(appicon.logo,
                      height: 80, color: Colors.white)),
            ),
            Row(children: [
              Perimerybtn(
                  txtcol: Classhandler.color.black,
                  name: "Login",
                  bgcol: Classhandler.color.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginView()));
                  },
                  isexpanded: true)
            ]),
            Gap(10),
            Row(children: [
              Perimerybtn(
                  name: "Sign Up",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signupview()));
                  },
                  isexpanded: true,
                  col: Colors.white,
                  bgcol: Colors.transparent),
              Gap(10),

            ])
            
          ]),
        ),
      ),
    );
  }
}
