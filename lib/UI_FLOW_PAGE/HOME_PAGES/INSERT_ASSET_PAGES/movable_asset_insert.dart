// ignore_for_file: unnecessary_string_escapes

import 'dart:io';

import 'package:asset_management/API_FILES/MODEL_CLASSES/move_insert_model.dart';
import 'package:asset_management/API_FILES/api_calls.dart';
import 'package:asset_management/STATELESS_WIDGET/flutter_tost.dart';
import 'package:asset_management/UTILS/color_const.dart';
import 'package:asset_management/UTILS/size_const.dart';
import 'package:asset_management/UTILS/text_const.dart';
import 'package:asset_management/UTILS/text_style_const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

enum OfficeSelect { officeA, officeB, officeC }

class MovableAssertInsert extends StatefulWidget {
  const MovableAssertInsert({Key? key}) : super(key: key);

  @override
  State<MovableAssertInsert> createState() => _MovableAssertInsertState();
}

class _MovableAssertInsertState extends State<MovableAssertInsert> {
  TextEditingController dateCtl = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  OfficeSelect? _isSelectoffice;
  bool isopened = false;
  DateTime? sDate;
  String? userIDs;
  String? datetime;
  bool isSubmit = false;

  //* list of Request data
  List<AssestInsertRequest> assestInputtRequest = [
    AssestInsertRequest(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(),
        body: buildBody(),
        floatingActionButton: fAB(),
        // bottomNavigationBar: buildBNB(assestInputtRequest.length),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
  }

  //*sharePreferences to call the UserId
  Future getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userIDs = prefs.getString("Uid");
    });
  }

  //*App bar
  buildAppbar() {
    return AppBar(
      backgroundColor: appColorW,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      title: Text(
        infor,
        style: tts4G,
      ),
      titleSpacing: 15,
      centerTitle: false,
      shadowColor: appColorW,
      // actions: [
      //   IconButton(
      //       onPressed: () {},
      //       icon: Icon(
      //         Icons.more_vert_rounded,
      //         size: 22,
      //         color: appColorG,
      //       ))
      // ],
    );
  }

  //*floting action button
  fAB() {
    if (isopened == true) {
      return FloatingActionButton(
        isExtended: true,
        backgroundColor: appColorG,
        onPressed: () {
          onAddForm();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Add Row',
            textAlign: TextAlign.center,
            style: tts2W,
          ),
        ),
      );
    }
  }

  //* add forms on tap of fAB
  void onAddForm() {
    setState(() {
      assestInputtRequest.add(AssestInsertRequest());
    });
  }

  //* remove the form on tap of delete
  void onDelete(int index) {
    setState(() {
      assestInputtRequest.removeAt(index);
    });
  }

  //* Body containe
  buildBody() {
    final mqH = MediaQuery.of(context).size.height;
    final mqW = MediaQuery.of(context).size.height;
    return Container(
      height: mqH,
      width: mqW,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            appColorW,
            appColorW,
            appColorG.withOpacity(0.5),
          ],
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            dashBoardData(),
            // buildforms(),
          ],
        ),
      ),
    );
  }
  //*DashBoard widget

  dashBoardData() {
    return Column(
      children: [
        // officedropDown(),
        expandedDropDown(),
        // buildforms(),
      ],
    );
  }

  //*Office DropDown

  officedropDown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        readOnly: true,
        initialValue: selectTheOffice,
        style: tts4B,
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: InkWell(
            onTap: () {
              showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.all(5),
                      insetPadding: EdgeInsets.all(8),
                      content: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                // color: appColorG,
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  selectTheOffice,
                                  style: tts4B,
                                ),
                              ),
                              dividerline(),
                              SizedBox(
                                // color: appColorG,
                                // height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: ListTile(
                                  leading: Radio<OfficeSelect>(
                                      value: OfficeSelect.officeA,
                                      groupValue: _isSelectoffice,
                                      onChanged: (OfficeSelect? val) {
                                        setState(() {
                                          _isSelectoffice = val;
                                        });
                                      }),
                                  title: Text(
                                    'Office-A',
                                    style: tts4B,
                                  ),
                                ),
                              ),
                              SizedBox(
                                // color: appColorG,
                                // height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: ListTile(
                                  leading: Radio<OfficeSelect>(
                                      value: OfficeSelect.officeB,
                                      groupValue: _isSelectoffice,
                                      onChanged: (OfficeSelect? val) {
                                        setState(() {
                                          _isSelectoffice = val;
                                        });
                                      }),
                                  title: Text(
                                    'Office-B',
                                    style: tts4B,
                                  ),
                                ),
                              ),
                              SizedBox(
                                // color: appColorG,
                                // height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: ListTile(
                                  leading: Radio<OfficeSelect>(
                                      value: OfficeSelect.officeC,
                                      groupValue: _isSelectoffice,
                                      onChanged: (OfficeSelect? val) {
                                        setState(() {
                                          _isSelectoffice = val;
                                        });
                                      }),
                                  title: Text(
                                    'Office-C',
                                    style: tts4B,
                                  ),
                                ),
                              ),
                              dividerline(),
                            ],
                          );
                        },
                      ),
                      actions: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Card(
                            elevation: 3,
                            color: appColorG,
                            child: Container(
                                alignment: Alignment.center,
                                height: 25,
                                width: 80,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Cancel",
                                    style: tts3W,
                                  ),
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Card(
                            elevation: 3,
                            color: appColorG,
                            child: Container(
                                alignment: Alignment.center,
                                height: 25,
                                width: 80,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Ok",
                                    style: tts3W,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    );
                  });
            },
            child: Icon(
              Icons.arrow_drop_down,
              size: 30,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  //*Expanded DropDown widget to show the table of Data

  expandedDropDown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            elevation: 5,
            shadowColor: appColorG,
            child: ExpansionTile(
              onExpansionChanged: (value) {
                setState(() {
                  isopened = value;
                });
              },
              initiallyExpanded: false,
              title: Text(
                'Office Property Information',
                style: tts5B,
              ),
              leading: Container(
                alignment: Alignment.center,
                height: 30,
                width: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), color: appColorG),
                child: Text(
                  '1',
                  style: tts4W,
                ),
              ),
              children: [
                dividerline(),
                SizedBox(
                  height: 5,
                ),
                dataTable(),
                SizedBox(
                  height: 5,
                ),
                dividerline(),
                buildBNB(assestInputtRequest.length),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //*Pick the date from the calander

  Future showcalander() async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: sDate ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 15),
        lastDate: DateTime(DateTime.now().year + 15));
    if (newDate == null) return;
    setState(() => sDate = newDate);
    debugPrint(sDate.toString());
    dateCtl.text = '${sDate!.day}-${sDate!.month}-${sDate!.year}';
    return datetime = '${sDate!.day}-${sDate!.month}-${sDate!.year}';
  }

  //*Table Data Title in column

  dataTable() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            // color: appColorG.withOpacity(0.5),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                      ),
                      border: Border(
                        bottom: BorderSide(color: appColorG),
                        top: BorderSide(color: appColorG),
                        left: BorderSide(color: appColorG),
                        right: BorderSide(color: appColorG),
                      ),
                    ),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'SL NO',
                        style: tts2G,
                      ),
                    )),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: appColorG),
                        top: BorderSide(color: appColorG),
                        left: BorderSide(color: appColorG),
                        right: BorderSide(color: appColorG),
                      ),
                    ),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        'Asset Name',
                        style: tts2G,
                      ),
                    )),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: appColorG),
                        top: BorderSide(color: appColorG),
                        left: BorderSide(color: appColorG),
                        right: BorderSide(color: appColorG),
                      ),
                    ),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Asset Qty',
                        style: tts2G,
                      ),
                    )),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: appColorG),
                        top: BorderSide(color: appColorG),
                        left: BorderSide(color: appColorG),
                        right: BorderSide(color: appColorG),
                      ),
                    ),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Asset Date',
                        style: tts2G,
                      ),
                    )),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                      ),
                      border: Border(
                        bottom: BorderSide(color: appColorG),
                        top: BorderSide(color: appColorG),
                        left: BorderSide(color: appColorG),
                        right: BorderSide(color: appColorG),
                      ),
                    ),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        'Asset Image',
                        style: tts2G,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
        assetdata(),
      ],
    );
  }

  // *  Row to add the data in enum's in listView

  assetdata() {
    return SingleChildScrollView(
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: assestInputtRequest.length,
          itemBuilder: (BuildContext context, int index) {
            return assestTable(index);
            // return addRow(index);
          }),
    );
  }
  //*Row to add

  assestTable(index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
          ),
        ),
        // color: appColorG.withOpacity(0.5),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: appColorG),
                    top: BorderSide(color: appColorG),
                    left: BorderSide(color: appColorG),
                    right: BorderSide(color: appColorG),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              if (index == 0) {
                                () {};
                              } else {
                                onDelete(index);
                              }
                            },
                            icon: index == 0
                                ? SizedBox()
                                : Icon(
                                    Icons.delete,
                                    size: 15,
                                    color: appColorG,
                                  ),
                          ),
                        ),
                        Expanded(child: Text('${index + 1}')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: appColorG),
                    top: BorderSide(color: appColorG),
                    left: BorderSide(color: appColorG),
                    right: BorderSide(color: appColorG),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      maxLines: 1,
                      style: tts3B,
                      onChanged: (val) {
                        setState(
                          () {
                            assestInputtRequest[index].astName = val;
                          },
                        );
                      },
                      decoration: InputDecoration(isDense: true),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: appColorG),
                    top: BorderSide(color: appColorG),
                    left: BorderSide(color: appColorG),
                    right: BorderSide(color: appColorG),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      style: tts3B,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        setState(
                          () {
                            assestInputtRequest[index].astQty =
                                int.tryParse(val);
                          },
                        );
                      },
                      decoration: InputDecoration(isDense: true),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: appColorG),
                    top: BorderSide(color: appColorG),
                    left: BorderSide(color: appColorG),
                    right: BorderSide(color: appColorG),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      onTap: () {
                        showcalander().then(
                          (value) {
                            setState(
                              () {
                                assestInputtRequest[index].astprdate = value;
                              },
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: assestInputtRequest[index].astprdate == null
                              ? Text(
                                  'Select',
                                  style: tts2G,
                                )
                              : Text(
                                  assestInputtRequest[index]
                                      .astprdate
                                      .toString(),
                                  style: tts1B,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: appColorG),
                    top: BorderSide(color: appColorG),
                    left: BorderSide(color: appColorG),
                    right: BorderSide(color: appColorG),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      onTap: () {
                        imagePicker.pickImage(source: ImageSource.camera).then(
                          (value) {
                            setState(
                              () {
                                assestInputtRequest[index].astimage =
                                    value!.path;
                              },
                            );
                            debugPrint(assestInputtRequest[index].astimage);
                          },
                        );
                      },
                      child: assestInputtRequest[index].astimage == null
                          ? SizedBox(
                              height: 50,
                              width: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Upload',
                                    style: tts2G,
                                  )
                                ],
                              ),
                            )
                          : Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: FileImage(
                                    File(
                                      assestInputtRequest[index]
                                          .astimage
                                          .toString(),
                                    ),
                                  ),
                                ),
                                shape: BoxShape.rectangle,
                                // color: Colors.black12,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  //* Submit button

  buildBNB(index) {
    return SizedBox(
      height: 45,
      // color: appColorG.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: appColorG,
                    primary: appColorG,
                    textStyle: tts3B,
                    shape: StadiumBorder()),
                onPressed: () async {
                  if (assestInputtRequest[index - 1].astName == null) {
                    showFlutterTost('Enter the Asset Name');
                  } else if (assestInputtRequest[index - 1].astQty == null) {
                    showFlutterTost('Enter the Asset Qty');
                  } else if (assestInputtRequest[index - 1].astprdate == null) {
                    showFlutterTost('Enter the Asset Pr Date');
                  } else if (assestInputtRequest[index - 1].astimage == null) {
                    showFlutterTost('Upload the photo');
                  } else {
                    setState(() => isSubmit = true);
                    apiServices
                        .assectInsert(assestInputtRequest)
                        .then((value) async {
                      debugPrint(value.toString());
                      if (value["status"] == true) {
                        await Future.delayed(Duration(seconds: 3));
                        setState(() => isSubmit = false);
                        showFlutterTost(value['message'].toString());
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'HomePage', (route) => false);
                      } else {
                        showFlutterTost('Something went wrong');
                      }
                    });
                  }
                },
                child: isSubmit
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        child: CircularProgressIndicator(
                          color: appColorW,
                          strokeWidth: 4,
                        ),
                      )
                    : Text(
                        'Submit',
                        style: tts4W,
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}