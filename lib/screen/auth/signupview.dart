import 'package:ecommerce_ui/components/Btnwidget/Perimerybtn.dart';
import 'package:ecommerce_ui/components/Textfiled/Preimerytextfield.dart';
import 'package:ecommerce_ui/controller/usercontroller.dart';
import 'package:ecommerce_ui/main.dart';
import 'package:ecommerce_ui/model/allmodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Signupview extends StatefulWidget {
  const Signupview({super.key});

  @override
  State<Signupview> createState() => _SignupviewState();
}

class _SignupviewState extends State<Signupview> {
  TextEditingController _username = TextEditingController();
  TextEditingController _Email = TextEditingController();
  TextEditingController _Password = TextEditingController();
  TextEditingController _conformpas = TextEditingController();
  bool ischeckvalue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            Gap(40),
            Center(
                child: Image.asset(Classhandler.icon.logo,
                    height: 80, fit: BoxFit.cover)),
            Gap(80),
            Text("Sign Up", style: Classhandler.txttheme.fs24Extra_bold()),
            Text("Create an new account",
                style: Classhandler.txttheme.fs16normal().copyWith(
                    color: Classhandler.color.black.withOpacity(0.5))),
            Gap(50),
            Perimerytextfield(txt: "User Name", controller: _username),
            Gap(25),
            Perimerytextfield(txt: "Email", controller: _Email),
            Gap(25),
            Perimerytextfield(txt: "Password", controller: _Password),
            Gap(25),
            Perimerytextfield(txt: "Confirm Password", controller: _conformpas),
            Gap(25),
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Checkbox.adaptive(
                  checkColor: Classhandler.color.white,
                  value: ischeckvalue,
                  onChanged: (bool? value) => setState(() {
                        ischeckvalue = value!;
                      })),
              Expanded(
                  child: Text(
                      "By creating an account you have to agree with our them & condition.",
                      style: Classhandler.txttheme
                          .fs14normal()
                          .copyWith(color: Classhandler.color.grey)))
            ]),
            Gap(40),
            Row(children: [
              Perimerybtn(
                  name: "Login",
                  bgcol: Classhandler.color.black,
                  onPressed: () async {
                    final data = Usermodel(
                        name: _username.text.trim(), email: _Email.text.trim());
                    await Usercontroller().signUp({
                      "user": data.tojson(),
                      "password": _Password.text.trim()
                    }, context);
                  },
                  isexpanded: true)
            ]),
          ],
        ),
      )),
    );
  }
}
