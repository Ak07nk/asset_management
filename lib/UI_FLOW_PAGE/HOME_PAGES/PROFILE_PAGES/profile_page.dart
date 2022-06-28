import 'dart:convert';
import 'dart:developer';

import 'package:asset_management/API_FILES/MODEL_CLASSES/profile_model.dart';
import 'package:asset_management/API_FILES/api_calls.dart';
import 'package:asset_management/STATELESS_WIDGET/text_button.dart';
import 'package:asset_management/UTILS/color_const.dart';
import 'package:asset_management/UTILS/text_style_const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../UTILS/text_const.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var fnamectr = TextEditingController();
  var lnamecrt = TextEditingController();
  var phonecrt = TextEditingController();
  var emailcrt = TextEditingController();
  // String? userIds;
  // String? userNamees;
  // String? userLastNamees;
  // String? userEmailIds;
  // String? userNum;
  ProfileResp? getProfile;
  bool readOnlyy = true;
  @override
  void initState() {
    // getSharedPreferences();
    getProfileDetail();
    super.initState();
  }

  getProfileDetail() {
    apiServices.getProfile().then((value) {
      try {
        if (value != null) {
          setState(() {
            getProfile = value;
          });
        }
      } catch (e) {
        if (value == null) {
          print('NO data');
        }
      }
      log(json.encode(getProfile.toString()));
    });
  }

  // Future getSharedPreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     userIds = prefs.getString("Uid");
  //     userNamees = prefs.getString("UFname");
  //     userLastNamees = prefs.getString("ULname");
  //     userEmailIds = prefs.getString("UEmailId");
  //     userNum = prefs.getString("UEMobile");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(),
        body: getProfile == null
            ? Center(child: CircularProgressIndicator())
            : buildBody(),
      ),
    );
  }

  //*Appbar
  buildAppbar() {
    return AppBar(
      backgroundColor: appColorW,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      title: Text(
        proFile,
        style: tts4G,
      ),
      titleSpacing: 15,
      centerTitle: false,
      shadowColor: appColorW,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              size: 22,
              color: appColorG,
            ))
      ],
    );
  }

  buildBody() {
    return ListView(
      children: [
        profileImage(),
        profileList(),
        SizedBox(
          height: 50,
        ),
        logOut()
      ],
    );
  }

  Container profileImage() {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      color: appColorG.withOpacity(0.3),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.black,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_960_720.png'))),
          height: 180,
          width: 180,
        ),
      ),
    );
  }

  profileList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: getProfile!.firstName!,
              style: tts5B,
              readOnly: true,
              // controller: fnamectr,
              decoration: InputDecoration(
                  hintText: 'azaz',
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  label: Text(
                    'First Name',
                    style: tts3G,
                  ),
                  contentPadding: EdgeInsets.all(2)),
            ),
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: getProfile!.lastName!,
              style: tts5B,
              // controller: lnamecrt,
              readOnly: true,
              decoration: InputDecoration(
                  hintText: 'azaz',
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  label: Text(
                    'Last Name',
                    style: tts3G,
                  ),
                  contentPadding: EdgeInsets.all(2)),
            ),
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: getProfile!.phone!,
              style: tts5B,
              // controller: phonecrt,
              readOnly: true,
              decoration: InputDecoration(
                  hintText: 'azaz',
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  label: Text(
                    'Mobile No',
                    style: tts3G,
                  ),
                  contentPadding: EdgeInsets.all(2)),
            ),
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: getProfile!.email!,
              style: tts5B,
              // controller: emailcrt,
              readOnly: true,
              decoration: InputDecoration(
                  hintText: 'azaz',
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  label: Text(
                    'Email id',
                    style: tts3G,
                  ),
                  contentPadding: EdgeInsets.all(2)),
            ),
          )),
        ),
      ],
    );
  }

  logOut() {
    return Column(
      children: [
        CusTextButton('Reset Password'),
        InkWell(
            onTap: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              await preferences.clear();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("LoginPage", (route) => false);
            },
            child: CusTextButton('LogOut')),
      ],
    );
  }
}
