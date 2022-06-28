import 'package:asset_management/STATELESS_WIDGET/custom_textform.dart';
import 'package:asset_management/STATELESS_WIDGET/text_button.dart';
import 'package:asset_management/UTILS/appp_image_const.dart';
import 'package:asset_management/UTILS/color_const.dart';
import 'package:asset_management/UTILS/text_const.dart';
import 'package:asset_management/UTILS/text_style_const.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController foremailctr = TextEditingController();
  TextEditingController _passwctr = TextEditingController();
  TextEditingController _cpasswctr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            appColorW,
            appColorW,
            appColorG,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: buildAppbar(),
        body: buildBody(),
      ),
    ));
  }

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  buildAppbar() {
    return AppBar(
      backgroundColor: appColorW,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      title: Text(
        forgotPass,
        style: tts4G,
      ),
      titleSpacing: 15,
      centerTitle: false,
      shadowColor: appColorW,
      // actions: [
      //   IconButton(
      //       onPressed: () {},
      //       icon: Icon(
      //         Icons.edit,
      //         size: 22,
      //         color: appColorG,
      //       ))
      // ],
    );
  }

  buildBody() {
    return SingleChildScrollView(
      // physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: Text(
              'Please Enter the Email to verify your Account',
              style: tts2G,
            )),
          ),
          Center(
              child: Container(
            width: MediaQuery.of(context).size.width,
            // color: appColorG,
            child: CustomTextField(
                'Enter the Email',
                'az@gmail.com',
                Icon(Icons.email),
                foremailctr,
                TextInputType.emailAddress,
                false),
          )),
          SizedBox(
            height: 10,
          ),
          CusTextButton('Verify'),
          SizedBox(
            height: 10,
          ),
          Container(
            // color: appColorG,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Text(
                    'Please Enter New password and Submit',
                    style: tts2G,
                  )),
                ),
                CustomTextField(
                    'New Password',
                    '••••••••••',
                    Icon(
                      Icons.password,
                      size: 25,
                      color: appColorG,
                    ),
                    _passwctr,
                    TextInputType.emailAddress,
                    _obscureText),
                CustomTextField(
                    'Confirm Password',
                    '••••••••••',
                    InkWell(
                      onTap: () {
                        _toggle();
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        size: 25,
                        color: appColorG,
                      ),
                    ),
                    _cpasswctr,
                    TextInputType.emailAddress,
                    _obscureText),
                SizedBox(
                  height: 15,
                ),
                CusTextButton('Submit'),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'LoginPage', (route) => false);
                  },
                  child: Text(
                    '• Back To Login • ',
                    style: tts2B,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
