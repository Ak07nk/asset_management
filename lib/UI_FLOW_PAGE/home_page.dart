import 'package:asset_management/UTILS/color_const.dart';
import 'package:asset_management/UTILS/text_style_const.dart';
import 'package:flutter/material.dart';

import '../UTILS/text_const.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(),
        body: buildBody(),
      ),
    );
  }

  buildAppbar() {
    return AppBar(
      backgroundColor: appColorW,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      title: Text(
        dashboard,
        style: tts4G,
      ),
      titleSpacing: 15,
      centerTitle: false,
      shadowColor: appColorW,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              size: 22,
              color: appColorG,
            ))
      ],
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
            appColorW,
            appColorW,
            appColorG,
          ],
        ),
      ),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [helloUser(), dashBoardData()],
      ),
    );
  }

  SizedBox helloUser() {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Text(
              hello,
              style: tts4G,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Text(
              userNam,
              style: tts7B,
            ),
          ),
        ],
      ),
    );
  }

  dashBoardData() {
    return Column(
      children: [
        widgetNum1(),
        widgetNum1(),
        widgetNum1(),
        widgetNum1(),
      ],
    );
  }

  SizedBox widgetNum1() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      // color: appColorB,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'PreVerification');
          },
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}
