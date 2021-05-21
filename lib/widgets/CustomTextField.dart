import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:motiou_dating_app/GlobalVariables/global_fonts.dart';
// import 'package:motiou_dating_app/Utilities/SizeConfig.dart';
import 'package:pitch_app/GlobalVariables/global_fonts.dart';
import 'package:pitch_app/helpers/size_config.dart';

class CustomizableTextField extends StatefulWidget {
  String hintText;
  bool enable;
  bool isPasswordField;
  TextEditingController controller;
  TextInputType textInputType;
  TextCapitalization textCapitalization;
  List<TextInputFormatter> textInputFormatter;
  Function validator;
  bool obsecuretext;

  CustomizableTextField({
    Key key,
    @required this.hintText,
    @required this.enable,
    @required this.isPasswordField,
    @required this.controller,
    @required this.textInputType,
    @required this.textCapitalization,
    @required this.textInputFormatter,
    @required this.validator,
    @required this.obsecuretext,
  });

  @override
  _CustomizableTextFieldState createState() => _CustomizableTextFieldState();
}

class _CustomizableTextFieldState extends State<CustomizableTextField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:ConfigSize.blockSizeVertical*6,
      width: ConfigSize.blockSizeHorizontal * 60,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: widget.obsecuretext,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        // textCapitalization: textCapitalization,
        enabled: widget.enable,
        inputFormatters: widget.textInputFormatter,
        validator: widget.validator,
        showCursor: true,
        decoration: InputDecoration(
          helperText: ' ',
          labelText: null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
            borderSide: BorderSide(
              color: Colors.grey,
              style: BorderStyle.none,
            ),
          ),
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(13.0)
          //     ),
          //   borderSide: BorderSide(
          //       color: Colors.grey,
          //       style: BorderStyle.solid
          //   ),
          //           ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(13.0)
          //     ),
          //     borderSide: BorderSide(
          //     color: purpleGradient,
          //     ),
          //     ),
          filled: true,
          fillColor: Color(0xFFF2F3F5),
          hintStyle: TextStyle(
              color: Color(0xFF666666),
              fontFamily: defaultFontFamily,
              fontSize: defaultFontSize),
        ),
      ),
    );
  }
}
