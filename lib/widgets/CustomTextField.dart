import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:motiou_dating_app/GlobalVariables/global_fonts.dart';
// import 'package:motiou_dating_app/Utilities/SizeConfig.dart';
import 'package:pitch_app/GlobalVariables/global_fonts.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/helpers/size_config.dart';

Widget customTextField({
  @required String hintText,
  @required bool enable,
  @required bool isPasswordField,
  @required TextEditingController controller,
  @required TextInputType textInputType,
  @required TextCapitalization textCapitalization,
  @required List<TextInputFormatter> textInputFormatter,
  @required Function validator,
  @required bool obscureText,
}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    obscureText: obscureText,
    controller: controller,
    keyboardType: textInputType,
    // textCapitalization: textCapitalization,
    enabled: enable,
    inputFormatters: textInputFormatter,
    validator: validator,
    showCursor: true,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(16),
      helperText: ' ',
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(13.0)),
      //   borderSide: BorderSide(
      //     color: Colors.grey,
      //     style: BorderStyle.solid,
      //   ),
      // ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(13.0)),
        borderSide: BorderSide(
          color: AppColors.mainColor,
          style: BorderStyle.solid,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(13.0)),
        borderSide: BorderSide(
          color: AppColors.greyColor,
          style: BorderStyle.solid,
        ),
      ),
      // filled: true,
      // fillColor: Color(0xFFF2F3F5),
      hintStyle: TextStyle(
          color: Color(0xFF666666),
          fontFamily: defaultFontFamily,
          fontSize: defaultFontSize),
    ),
  );
}
