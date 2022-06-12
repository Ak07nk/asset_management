import 'dart:async';

import 'package:asset_management/UTILS/color_const.dart';
import 'package:asset_management/UTILS/text_style_const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../UTILS/appp_image_const.dart';
import '../../UTILS/text_const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTime();
    super.initState();
  }

  startTime() async {
    var _duration = const Duration(seconds: 2);
    return Timer(_duration, checkforlogin);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: buildAppBar(),
        body: buildBody(),
        bottomNavigationBar: buildBNB(),
      ),
    );
  }

  Future<void> checkforlogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    dynamic uEmail = prefs.getString("UEmailId");
    // ignore: avoid_print
    print(uEmail);

    if (uEmail == null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil("LoginPage", (route) => false);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil("HomePage", (route) => false);
    }
  }

  buildAppBar() {
    return AppBar(
      title: const Text('splash screen'),
    );
  }

  buildBody() {
    final mqH = MediaQuery.of(context).size.height;
    final mqW = MediaQuery.of(context).size.height;
    return Container(
      height: mqH,
      width: mqW,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(appLogo2),
                  fit: BoxFit.fill,
                )),
            height: 250,
            width: 250,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            appName.toUpperCase(),
            style: tts6B,
          ),
          const SizedBox(
            height: 80,
          ),
          CircularProgressIndicator(
            color: appColorG,
            strokeWidth: 3,
          )
        ],
      ),
    );
  }

  buildBNB() {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: const [
          Text(
            developedby,
            style: tts1B,
          ),
          Text(
            appversion,
            style: tts2B,
          ),
        ],
      ),
    );
  }
}
