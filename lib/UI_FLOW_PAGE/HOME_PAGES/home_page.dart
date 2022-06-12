import 'package:asset_management/UTILS/color_const.dart';
import 'package:asset_management/UTILS/text_const.dart';
import 'package:asset_management/UTILS/text_style_const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userIds;
  String? userNamees;
  String? userLastNamees;
  String? userEmailIds;
  @override
  void initState() {
    super.initState();
    getSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(),
        body: buildBody(),
      ),
    );
  }

  Future getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userIds = prefs.getString("Uid");
      userNamees = prefs.getString("UFname");
      userLastNamees = prefs.getString("ULname");
      userEmailIds = prefs.getString("UEmailId");
    });
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
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'ProfilePage');
          },
          child: Icon(
            Icons.person,
            color: appColorG,
          ),
        ),
        SizedBox(
          width: 5,
        )
      ],
    );
  }

  buildBody() {
    final mqH = MediaQuery.of(context).size.height;
    final mqW = MediaQuery.of(context).size.height;
    return Container(
      height: mqH,
      width: mqW,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
          colors: const [
            appColorW,
            appColorW,
            appColorG,
          ],
        ),
      ),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          helloUser(),
          widgetNum2(),
        ],
      ),
    );
  }

  SizedBox helloUser() {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              userNamees != null
                  ? userNamees!.toUpperCase() +
                      " " +
                      userLastNamees!.toUpperCase()
                  : 'Guest',
              style: tts7B,
            ),
          ),
        ],
      ),
    );
  }

  widgetNum2() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(15),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'PreVerification');
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              shadowColor: appColorG,
              color: appColorW,
              elevation: 5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 150,
                      // color: appColorB,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/officeIcon.png'))),
                    ),
                  ),
                  Divider(
                    height: 12,
                    color: appColorG,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Office',
                      style: tts3B,
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'ReportPage');
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              shadowColor: appColorG,
              color: appColorW,
              elevation: 5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 150,
                      // color: appColorB,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/report-icon.jpg'))),
                    ),
                  ),
                  Divider(
                    height: 12,
                    color: appColorG,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Report',
                      style: tts3B,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  widgetNum1() {
    return SizedBox(
      // height: MediaQuery.of(context).size.height,
      child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              crossAxisCount: 2,
              childAspectRatio: 1),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'PreVerification');
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                shadowColor: appColorG,
                color: appColorW,
                elevation: 5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: 150,
                        // color: appColorB,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/officeIcon.png'))),
                      ),
                    ),
                    Divider(
                      height: 12,
                      color: appColorG,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Office',
                        style: tts3B,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  widgetNum3() {
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
