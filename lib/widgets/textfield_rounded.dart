import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../colors.dart';

class RoundedTextField extends StatelessWidget {
  final String hint, initialValue;
  int maxLines;
  RoundedTextField({this.hint, this.maxLines = 1, this.initialValue});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      initialValue: initialValue,
      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 8, left: 8),
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.greyColor),
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
            color: Colors.grey.shade400,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
