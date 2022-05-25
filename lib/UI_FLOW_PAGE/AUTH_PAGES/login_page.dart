import 'package:asset_management/UTILS/color_const.dart';
import 'package:asset_management/UTILS/text_style_const.dart';
import 'package:flutter/material.dart';

import '../../STATELESS_WIDGET/custom_textform.dart';
import '../../STATELESS_WIDGET/text_button.dart';
import '../../UTILS/appp_image_const.dart';
import '../../UTILS/text_const.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginCTR = TextEditingController();
  TextEditingController passCTR = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildBody(),
      ),
    );
  }

  buildBody() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            appColorG,
            appColorW,
            appColorW,
          ],
        ),
      ),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          logo(),
          welcome(),
          SizedBox(
            height: 30,
          ),
          loginTIT(),
          loginAcc(),
          SizedBox(
            height: 30,
          ),
          loginBut()
        ],
      ),
    );
  }

  logo() {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: appColorW,
          ),
          height: 250,
          width: 250,
          child: const Image(
            image: AssetImage(appLogo),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  welcome() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          welcom1,
          style: tts4B,
        ),
        Text(
          welcom2,
          style: tts4GD,
        ),
      ],
    );
  }

  loginTIT() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        // color: Colors.black,
        alignment: Alignment.center,
        child: Text(
          pLZ,
          style: tts3B,
        ),
      ),
    );
  }

  loginAcc() {
    return Container(
      alignment: Alignment.center,
      // color: appColorB,
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          CustomTextField(
              "Login Id",
              'AZ00125',
              Icon(
                Icons.person,
                size: 25,
                color: appColorG,
              ),
              loginCTR,
              false),
          CustomTextField(
              "Password",
              '********',
              Icon(
                Icons.visibility_off,
                size: 25,
                color: appColorG,
              ),
              passCTR,
              true),
        ],
      ),
    );
  }

  loginBut() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, 'HomePage', (route) => true);
          },
          child: CusTextButton(
            'LogIn',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            '• SignUp •',
            style: tts3B,
          ),
        )
      ],
    );
  }
}
