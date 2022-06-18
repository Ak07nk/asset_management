import 'package:asset_management/API_FILES/MODEL_CLASSES/imMovablerepid_model.dart';
import 'package:asset_management/API_FILES/api_calls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:asset_management/UTILS/color_const.dart';
import 'package:asset_management/UTILS/text_const.dart';
import 'package:asset_management/UTILS/text_style_const.dart';

class IMmovreportId extends StatefulWidget {
  const IMmovreportId({Key? key}) : super(key: key);

  @override
  State<IMmovreportId> createState() => _IMmovreportIdState();
}

class _IMmovreportIdState extends State<IMmovreportId> {
  ImMovAblRepIdRespond? imMovDRId;
  String? repId;
  void initstate() {
    super.initState();
    getDetaileReportData();
  }

  void getDetaileReportData() {
    repId = ModalRoute.of(context)!.settings.arguments as String?;
    apiServices.immovreportid(repId!).then((value) {
      setState(() {
        imMovDRId = value;
      });
      // ignore: avoid_print
      print(imMovDRId);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (imMovDRId == null) {
      getDetaileReportData();
    }
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(),
        body: imMovDRId == null
            ? const Center(child: CircularProgressIndicator.adaptive())
            : buildBody(),
      ),
    );
  }

  buildAppbar() {
    return AppBar(
      backgroundColor: appColorW,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      title: Text(
        imrepid,
        style: tts4G,
      ),
      titleSpacing: 15,
      centerTitle: false,
      shadowColor: appColorW,
    );
  }

  buildBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
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
            child: reportIdpage(),
          ),
          // reportIdpage()
        ],
      ),
    );
  }

  reportIdpage() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          ListOfrep(
              'Name :', imMovDRId!.astName != null ? imMovDRId!.astName : ''),
          ListOfrep(
              'Qty :', imMovDRId!.astQty != null ? imMovDRId!.astQty : ''),
          ListOfrep(
              'Date', imMovDRId!.astPrDate != null ? imMovDRId!.astPrDate : ''),
          ListOfrep('Condution',
              imMovDRId!.astCondition != null ? imMovDRId!.astCondition : ''),
          ListOfrep('Pincode',
              imMovDRId!.astPincode != null ? imMovDRId!.astPincode : ''),
          ListOfrep('Address',
              imMovDRId!.astAddress != null ? imMovDRId!.astAddress : ''),
          imageupdate()
        ],
      ),
    );
  }

  imageupdate() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Container(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  color: appColorG,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'Asset Image',
                      style: tts3W,
                    ),
                  )),
            ],
          ),
          height: 500,
          width: 400,
          // color: appColorW,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imMovDRId!.astImage == null
                      ? imMovDRId!.astImage!
                      : 'https://cdn.pixabay.com/photo/2021/09/13/08/13/dahlia-6620610_640.jpg'))),
        ),
      ),
    );
  }
}

class ListOfrep extends StatelessWidget {
  String? titleText;
  String? leadingText;
  ListOfrep(
    this.leadingText,
    this.titleText,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
          elevation: 5,
          child: ListTile(
            dense: true,
            leading: Text(
              leadingText!,
              style: tts5B,
            ),
            title: Text(
              titleText!,
              style: tts4B,
            ),
          )),
    );
  }
}
