import 'package:asset_management/UTILS/text_style_const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String? labelText;
  String? hintText;
  Widget? icondata;

  TextEditingController? controller;
  bool obscureText;

  CustomTextField(this.labelText, this.hintText, this.icondata, this.controller,
      this.obscureText,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        elevation: 0,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: TextFormField(
            obscureText: obscureText,
            style: tts6B,
            cursorHeight: 25,
            cursorColor: Colors.black,
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                suffixIcon: icondata,
                isDense: true,
                labelText: labelText,
                labelStyle: tts4B,
                hintText: hintText,
                hintStyle: tts4GY),
          ),
        ),
      ),
    );
  }
}
