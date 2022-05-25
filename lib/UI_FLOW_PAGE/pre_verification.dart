import 'package:asset_management/UTILS/color_const.dart';
import 'package:asset_management/UTILS/text_style_const.dart';
import 'package:flutter/material.dart';

import '../STATELESS_WIDGET/text_button.dart';
import '../UTILS/text_const.dart';

class PreVerification extends StatefulWidget {
  const PreVerification({Key? key}) : super(key: key);

  @override
  State<PreVerification> createState() => _PreVerificationState();
}

class _PreVerificationState extends State<PreVerification> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(),
        body: buildBody(),
        bottomNavigationBar: buildBNB(),
      ),
    );
  }

  buildAppbar() {
    return AppBar(
      backgroundColor: appColorW,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      title: Text(
        preVerify,
        style: tts4G,
      ),
      titleSpacing: 15,
      centerTitle: false,
      shadowColor: appColorW,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_rounded,
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
        children: [dashBoardData()],
      ),
    );
  }

  dashBoardData() {
    return Column(
      children: [
        widgetNum1(),
      ],
    );
  }

  widgetNum1() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              crossAxisCount: 2,
              childAspectRatio: 1.5),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              shadowColor: appColorG,
              color: appColorW,
              elevation: 5,
            );
          }),
    );
  }

  buildBNB() {
    return Container(
      height: 50,
      color: appColorB,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CusTextButton('data'),
          CusTextButton('data'),
        ],
      ),
    );
  }
}
