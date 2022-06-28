import 'package:asset_management/API_FILES/MODEL_CLASSES/register_model.dart';
import 'package:flutter/material.dart';

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

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController firstCTR = TextEditingController();
  TextEditingController lastCTR = TextEditingController();
  TextEditingController emailCTR = TextEditingController();
  TextEditingController phNoCTR = TextEditingController();
  TextEditingController roleCTR = TextEditingController();
  TextEditingController regidCTR = TextEditingController();
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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        // color: Colors.black,
        alignment: Alignment.center,
        child: Text(
          pLZreg,
          style: tts3B,
        ),
      ),
    );
  }

  loginAcc() {
    return Container(
      // color: appColorB,

      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          CustomTextField(
            "First Name",
            'AZ',
            Icon(
              Icons.account_box,
              size: 25,
              color: appColorG,
            ),
            firstCTR,
            TextInputType.emailAddress,
            false,
          ),
          CustomTextField(
            "Last Name",
            'AZ',
            Icon(
              Icons.account_box,
              size: 25,
              color: appColorG,
            ),
            lastCTR,
            TextInputType.emailAddress,
            false,
          ),
          CustomTextField(
            "Email id",
            'AZ@domain.com',
            Icon(
              Icons.mail,
              size: 25,
              color: appColorG,
            ),
            emailCTR,
            TextInputType.emailAddress,
            false,
            //
          ),
          CustomTextField(
            "Phone No",
            '9876543210',
            Icon(
              Icons.phone,
              size: 25,
              color: appColorG,
            ),
            phNoCTR,
            TextInputType.number,
            false,
          ),
          // CustomTextField(
          //   "Role",
          //   '12345',
          //   Icon(
          //     Icons.person_pin,
          //     size: 25,
          //     color: appColorG,
          //   ),
          //   roleCTR,
          //   TextInputType.number,
          //   false,
          // ),
          // CustomTextField(
          //   "Reg Id",
          //   'AZ12345',
          //   Icon(
          //     Icons.person,
          //     size: 25,
          //     color: appColorG,
          //   ),
          //   regidCTR,
          //   false,
          // ),
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
            RegisterReq registerReq = RegisterReq(
              firstName: firstCTR.value.text,
              lastName: lastCTR.value.text,
              phone: phNoCTR.value.text,
              role: roleCTR.value.text,
              email: emailCTR.value.text,
              password: _passCTR.value.text,
            );
            if (registerReq.email!.isEmpty) {
              showFlutterTost(
                'Enter Your Email',
              );
            } else if (!registerReq.email!.contains('@'))
              showFlutterTost(
                'Enter The Valid Email',
              );
            else if (!registerReq.email!.contains('.com'))
              showFlutterTost(
                'Enter The Valid Email',
              );
            else if (registerReq.phone!.length < 10)
              showFlutterTost(
                'Enter The Valid Phone Number',
              );
            else if (registerReq.phone!.length > 10)
              showFlutterTost(
                'Enter The Valid Phone Number',
              );
            else if (registerReq.password!.isEmpty) {
              showFlutterTost(
                'Enter Your Password',
              );
            } else if (registerReq.password!.length < 4) {
              showFlutterTost(
                'Enter Your Password Atleast 8 Character',
              );
            } else {
              registerprocess(registerReq);
            }
          },
          child: CusTextButton(
            'Register',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account.?',
                style: tts3B,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'LoginPage', (route) => false);
                  // Navigator.pushAndRemoveUntil(
                  //     context, newRoute, (route) => false);
                },
                child: Text(
                  ' • Login Now •',
                  style: tts3G,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  registerprocess(RegisterReq registerReq) {
    apiServices.register(registerReq).then((value) async {
      if (value['status'] == true) {
        showFlutterTost('Congratulations You Have Successfully Register');
        Navigator.pushNamedAndRemoveUntil(
            context, 'LoginPage', (route) => false);
      }
    });
  }
}
