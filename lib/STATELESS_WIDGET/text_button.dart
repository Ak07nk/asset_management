// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../UTILS/color_const.dart';
import '../UTILS/text_style_const.dart';

class CusTextButton extends StatelessWidget {
  String? butName;

  CusTextButton(this.butName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.all(5),
      color: appColorG,
      child: Container(
        alignment: Alignment.center,
        width: 180,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            butName!,
            style: tts6WW,
          ),
        ),
      ),
    );
  }
}
class CusTextButtonAnimat extends StatelessWidget {
  String? butName;

  CusTextButtonAnimat(this.butName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.all(5),
      color: appColorG,
      child: Container(
        alignment: Alignment.center,
        width: 180,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            butName!,
            style: tts6WW,
          ),
        ),
      ),
    );
  }
}
