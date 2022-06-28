import 'package:asset_management/UTILS/color_const.dart';
import 'package:asset_management/UTILS/text_style_const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API_FILES/MODEL_CLASSES/login_model.dart';
import '../../API_FILES/api_calls.dart';
import '../../STATELESS_WIDGET/custom_textform.dart';
import '../../STATELESS_WIDGET/flutter_tost.dart';
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
  TextEditingController _passCTR = TextEditingController();

  bool _obscureText = true;
  // String _password;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
              image: DecorationImage(
                image: AssetImage(appLogo2),
                fit: BoxFit.cover,
              )),
          height: 250,
          width: 250,
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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
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
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          CustomTextField(
            "Login Id",
            'AZ12345',
            Icon(
              Icons.person,
              size: 25,
              color: appColorG,
            ),
            loginCTR,
            TextInputType.emailAddress,
            false,
          ),
          CustomTextField(
            "Password",
            '•••••••••',
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
            _passCTR,
            TextInputType.emailAddress,
            _obscureText,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forgot Password...?  ',
                  style: tts2B,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'ForgotPassword');
                  },
                  child: Text(
                    '• Click Here •',
                    style: tts2G,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  loginBut() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            LoginRequest loginRequest = LoginRequest(
              xAPIKEY: "PTAX@123",
              email: loginCTR.value.text,
              password: _passCTR.value.text,
            );
            if (loginRequest.email!.isEmpty) {
              showFlutterTost(
                'Enter Your Email',
              );
            }
            //  else if (!loginRequest.email!.contains('@')) {
            //   showFlutterTost(
            //     'Enter The Valid Email',
            //   );
            // }
            else if (loginRequest.password!.isEmpty) {
              showFlutterTost(
                'Enter Your Password',
              );
            } else {
              loginprocess(loginRequest);
            }
          },
          child: CusTextButton(
            'LogIn',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t Have an Account.?',
                style: tts3B,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'RegisterPage');
                },
                child: Text(
                  ' • Register Now • ',
                  style: tts3G,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  loginprocess(LoginRequest loginRequest) {
    apiServices.login(loginRequest).then((value) async {
      if (value['status'] == true) {
        SharedPreferences? prefs = await SharedPreferences.getInstance();
        prefs.setString(userId, value['data']['id']);
        prefs.setString(userNamee, value['data']['first_name']);
        prefs.setString(userLastNamee, value['data']['last_name']);
        prefs.setString(userEmailId, value['data']['email']);
        prefs.setString(userNum, value['data']['phone']);
        debugPrint("userId:::>" + userId);
        debugPrint("userName:::>" + userNamee);
        debugPrint("userEmail:::>" + userEmailId);
        debugPrint("userMobile:::>" + userNum);
        showFlutterTost('Congratulations You Have Successfully LogIn');
        Navigator.pushNamedAndRemoveUntil(
            context, 'HomePage', (route) => false);
      }
    });
  }
}
