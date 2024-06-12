import 'package:ecommerce_ui/components/Btnwidget/Perimerybtn.dart';
import 'package:ecommerce_ui/components/Textfiled/Preimerytextfield.dart';
import 'package:ecommerce_ui/controller/usercontroller.dart';
import 'package:ecommerce_ui/main.dart';
import 'package:ecommerce_ui/model/allmodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _Email = TextEditingController();
  TextEditingController _Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Classhandler.color.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: ListView(
          children: [
            Gap(40),
            Center(
                child: Image.asset(Classhandler.icon.logo,
                    height: 80, fit: BoxFit.cover)),
            Gap(40),
            Text("Welcome!", style: Classhandler.txttheme.fs24Extra_bold()),
            Text("please login or sign up to continue our app",
                style: Classhandler.txttheme.fs16normal().copyWith(
                    color: Classhandler.color.black.withOpacity(0.5))),
            Gap(40),
            Perimerytextfield(txt: "Email", controller: _Email),
            Gap(20),
            Perimerytextfield(txt: "Password", controller: _Password),
            Gap(50),
            Consumer<Usercontroller>(
              builder: (context, user, child) {
                return Row(children: [
                  Perimerybtn(
                      loadingvalue: true,
                      name: "Login",
                      onPressed: () {
                        final data = Usermodel(
                            name: _Email.text.trim(),
                            email: _Email.text.trim());
                        user.Login({
                          "user": data.tojson(),
                          "password": _Password.text.trim()
                        }, context);
                      },
                      isexpanded: true)
                ]);
              },
            ),
            Gap(10),
            Row(children: [
              Expanded(child: Divider()),
              Text("Or", style: Classhandler.txttheme.fs16normal()),
              Expanded(child: Divider())
            ]),
            Gap(10),
            Perimerybtn(
              img: Classhandler.icon.facebook,
              name: "Continue with Facebook",
              onPressed: () {},
              bgcol: Classhandler.color.blue,
            ),
            Gap(20),
            Perimerybtn(
              img: Classhandler.icon.google,
              name: "Continue with Google",
              onPressed: () {},
              txtcol: Classhandler.color.grey,
              col: Classhandler.color.grey.withOpacity(0.1),
              bgcol: Classhandler.color.white,
            ),
            Gap(20),
            Perimerybtn(
              img: Classhandler.icon.Apple,
              txtcol: Classhandler.color.grey,
              name: "Continue with Apple",
              onPressed: () {},
              col: Classhandler.color.grey.withOpacity(0.1),
              bgcol: Classhandler.color.white,
            ),
          ],
        ),
      ),
    );
  }
}
