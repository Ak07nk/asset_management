import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/REPORT_ID_PAGE/immovreport_id.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/REPORT_ID_PAGE/movreport_id.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/home_page.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/immovable_asset_insert.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/immoveable_report_page.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/movable_asset_insert.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/profile_page.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/moveable_report_page.dart';
import 'package:flutter/material.dart';

import 'UI_FLOW_PAGE/AUTH_PAGES/login_page.dart';
import 'UI_FLOW_PAGE/AUTH_PAGES/splashscreen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asset Management',
      theme: ThemeData(
        fontFamily: "Overpass",
        primarySwatch: Colors.green,
      ),
      routes: {
        'SplashScreen': (context) => const SplashScreen(),
        'LoginPage': (context) => const LoginPage(),
        'HomePage': (context) => const HomePage(),
        'PreVerification': (context) => const PreVerification(),
        'ImMoveableAssetInsert': (context) => const ImMoveableAssetInsert(),
        'ReportPage': (context) => const ReportPage(),
        'ImMoveableReport': (context) => const ImMoveableReport(),
        'ProfilePage': (context) => const ProfilePage(),
        'IMmovreportId': (context) => const IMmovreportId(),
        'MovreportId': (context) => const MovreportId(),
      },
      initialRoute: 'SplashScreen',
      debugShowCheckedModeBanner: false,
    );
  }
}
