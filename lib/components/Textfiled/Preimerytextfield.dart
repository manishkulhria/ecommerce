import 'package:ecommerce_ui/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Perimerytextfield extends StatelessWidget {
  String txt;
  TextEditingController? controller;
  Perimerytextfield({super.key, required this.txt, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(txt, style: Classhandler.txttheme.fs16medium()),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: -1),
            isDense: true,
            border: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Classhandler.color.grey.withOpacity(0.6))),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Classhandler.color.grey.withOpacity(0.6))),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Classhandler.color.grey.withOpacity(0.6))),
          ),
        ),
      ],
    );
  }
}
