import 'package:ecommerce_ui/main.dart';
import 'package:ecommerce_ui/resource/constant/Texttheme.dart';
import 'package:ecommerce_ui/resource/constant/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Perimerybtn extends StatelessWidget {
  String name;
  String? img;
  bool isexpanded;
  Function onPressed;
  Color? col, bgcol, txtcol;
  Perimerybtn(
      {super.key,
      required this.name,
      this.isexpanded = false,
      required this.onPressed,
      this.col,
      this.img,
      this.bgcol,
      this.txtcol});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors();
    final style = Apptexttheme();
    final btn = TextButton.icon(
        icon: img != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(img!, height: 30))
            : SizedBox(),
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
                side: col != null
                    ? BorderSide(color: col!)
                    : BorderSide(color: Classhandler.color.white)),
            backgroundColor: bgcol != null ? bgcol : colors.black),
        onPressed: () {
          onPressed();
        },
        label: Text(
          name,
          style: style
              .fs20medium()
              .copyWith(color: txtcol != null ? txtcol : colors.white),
        ));
    return isexpanded ? Expanded(child: btn) : btn;
  }
}
