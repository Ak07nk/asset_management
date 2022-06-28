import 'package:asset_management/UI_FLOW_PAGE/AUTH_PAGES/register_page.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/INSERT_ASSET_PAGES/construction_asset_insert.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/REPORT_ID_PAGE/construction_id.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/REPORT_ID_PAGE/immovreport_id.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/REPORT_ID_PAGE/movreport_id.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/MAIN_HOME_PAGE/home_page.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/INSERT_ASSET_PAGES/immovable_asset_insert.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/REPORT_PAGES/construction_report_page.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/REPORT_PAGES/immoveable_report_page.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/INSERT_ASSET_PAGES/movable_asset_insert.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/PROFILE_PAGES/profile_page.dart';
import 'package:asset_management/UI_FLOW_PAGE/HOME_PAGES/REPORT_PAGES/moveable_report_page.dart';
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
        'RegisterPage': (context) => const RegisterPage(),
        'HomePage': (context) => const HomePage(),
        'MovableAssertInsert': (context) => const MovableAssertInsert(),
        'ImMoveableAssetInsert': (context) => const ImMoveableAssetInsert(),
        'ConstructionAssetInsert': (context) => const ConstructionAssetInsert(),
        'ReportPage': (context) => const ReportPage(),
        'ImMoveableReport': (context) => const ImMoveableReport(),
        'ConstructionReport': (context) => const ConstructionReport(),
        'ProfilePage': (context) => const ProfilePage(),
        'MovreportId': (context) => const MovreportId(),
        'IMmovreportId': (context) => const IMmovreportId(),
        'ConstructionId': (context) => const ConstructionId(),
      },
      initialRoute: 'SplashScreen',
      debugShowCheckedModeBanner: false,
    );
  }
}
