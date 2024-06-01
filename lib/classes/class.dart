import 'package:ecommerce_ui/resource/constant/Getappimg.dart';
import 'package:ecommerce_ui/resource/constant/Texttheme.dart';
import 'package:ecommerce_ui/resource/constant/appcolors.dart';

class Mainclassdata {
  Mainclassdata._data();
  static final Mainclassdata instance = Mainclassdata._data();

  // ---------------- ALL COLORS ------------------

  final _colorsdata = AppColors();
  AppColors get color => _colorsdata;
  // ---------------- ALL TEXT THEME ------------------

  final _texttheme = Apptexttheme();
  Apptexttheme get txttheme => _texttheme;

  // ---------------- ALL IMAGE ------------------

  final _Allimage = Getappimg();
  Getappimg get image => _Allimage;
  // ---------------- ALL ICON ------------------

  final _Allicon = Getappicon();
  Getappicon get icon => _Allicon;
}
