import 'dart:io';

import 'package:asset_management/API_FILES/MODEL_CLASSES/assest_insert_model.dart';
import 'package:asset_management/STATELESS_WIDGET/flutter_tost.dart';
import 'package:asset_management/UTILS/color_const.dart';
import 'package:asset_management/UTILS/text_style_const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import '../API_FILES/api_calls.dart';
import '../STATELESS_WIDGET/text_button.dart';
import '../UTILS/size_const.dart';
import '../UTILS/text_const.dart';

enum OfficeSelect { officeA, officeB, officeC }

class PreVerification extends StatefulWidget {
  const PreVerification({Key? key}) : super(key: key);

  @override
  State<PreVerification> createState() => _PreVerificationState();
}

class _PreVerificationState extends State<PreVerification> {
  TextEditingController dateCtl = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  OfficeSelect? _isSelectoffice;
  bool isopened = false;
  DateTime? sDate;
  String? userIDs;
  String? datetime;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(),
        body: buildBody(),
        floatingActionButton: fAB(),
        bottomNavigationBar: buildBNB(assestInputtRequest.length),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
  }

  Future getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userIDs = prefs.getString("Uid");
    });
  }

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

  fAB() {
    if (isopened == true) {
      return FloatingActionButton(
        backgroundColor: appColorG,
        onPressed: () {
          onAddForm();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Add Form',
            textAlign: TextAlign.center,
            style: tts2W,
          ),
        ),
      );
    }
  }

  /// add forms on tap of fAB
  void onAddForm() {
    setState(() {
      assestInputtRequest.add(AssestInsertRequest());
    });
  }

  /// remove the form on tap of delete
  void onDelete(int index) {
    setState(() {
      assestInputtRequest.removeAt(index);
    });
  }

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
        child: Column(
          children: [
            dashBoardData(),
            // buildforms(),
          ],
        ),
      ),
    );
  }

  dashBoardData() {
    return Column(
      children: [
        // officedropDown(),
        expandedDropDown(),
        // buildforms(),

        // buildAssestList()
        // expandedDropDown(),
      ],
    );
  }

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

  expandedDropDown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Card(
          //   elevation: 5,
          //   shadowColor: appColorG,
          //   child: ExpansionTile(
          //     initiallyExpanded: false,
          //     title: Text(
          //       'Information',
          //       style: tts5B,
          //     ),
          //     leading: Container(
          //       alignment: Alignment.center,
          //       height: 28,
          //       width: 28,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(50),
          //           color: appColorG.withOpacity(0.7)),
          //       child: Text(
          //         '1',
          //         style: tts4W,
          //       ),
          //     ),
          //     children: [
          //       dividerline(),
          //       Column(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: TextFormField(
          //               // readOnly: true,
          //               style: tts4B,
          //               decoration: InputDecoration(
          //                 hintText: 'Name',
          //                 hintStyle: tts4GY,
          //                 isDense: true,
          //                 border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(8)),
          //               ),
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: TextFormField(
          //               // readOnly: true,
          //               style: tts4B,
          //               decoration: InputDecoration(
          //                 hintText: 'Mobile No',
          //                 hintStyle: tts4GY,
          //                 isDense: true,
          //                 border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(8)),
          //               ),
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: TextFormField(
          //               // readOnly: true,
          //               style: tts4B,
          //               decoration: InputDecoration(
          //                 hintText: 'Pin Code',
          //                 hintStyle: tts4GY,
          //                 isDense: true,
          //                 border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(8)),
          //               ),
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: TextFormField(
          //               // readOnly: true,
          //               style: tts4B,
          //               maxLength: 500,
          //               maxLines: 5,
          //               decoration: InputDecoration(
          //                 hintText: 'Address',
          //                 hintStyle: tts4GY,
          //                 isDense: true,
          //                 border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(8)),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
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
                buildforms(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildforms() {
    return SingleChildScrollView(
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: assestInputtRequest.length,
          itemBuilder: (BuildContext context, int index) {
            return assestForm(index);
          }),
    );
  }

  Padding assestForm(index) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppBar(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: appColorG,
                leading: Icon(
                  Icons.format_align_left_rounded,
                  size: 25,
                  color: appColorW,
                ),
                centerTitle: true,
                elevation: 0,
                title: Text(
                  'Form : ' '${index + 1}',
                  style: tts4W,
                ),
                actions: [
                  IconButton(
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
                            color: appColorW,
                          ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // readOnly: true,
                style: tts4B,
                onChanged: (val) {
                  setState(() {
                    assestInputtRequest[index].astName = val;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Asset Name',
                  hintStyle: tts4GY,
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // readOnly: true,
                style: tts4B,
                onChanged: (val) {
                  setState(() {
                    assestInputtRequest[index].astDesc = val;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Asset desc',
                  hintStyle: tts4GY,
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // readOnly: true,
                style: tts4B,
                onChanged: (val) {
                  setState(() {
                    assestInputtRequest[index].astCat = int.tryParse(val);
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Asset cat',
                  hintStyle: tts4GY,
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // readOnly: true,
                style: tts4B,
                onChanged: (val) {
                  setState(() {
                    assestInputtRequest[index].astQty = int.tryParse(val);
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Asset Qty',
                  hintStyle: tts4GY,
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // readOnly: true,
                style: tts4B,
                onChanged: (val) {
                  setState(() {
                    assestInputtRequest[index].astCondition = val;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Asset condition',
                  hintStyle: tts4GY,
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // readOnly: true,
                style: tts4B,

                onChanged: (val) {
                  setState(() {
                    assestInputtRequest[index].astRemarks = val;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Asset remark',
                  hintStyle: tts4GY,
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextFormField(
            //     readOnly: true,
            //     initialValue: userIDs,
            //     style: tts4B,
            //     onChanged: (userIDs) {
            //       setState(() {
            //         assestInputtRequest[index].createdBy =
            //             int.tryParse(userIDs);
            //       });
            //       debugPrint(userIDs);
            //     },
            //     decoration: InputDecoration(
            //       hintText: 'Created By',
            //       hintStyle: tts4GY,
            //       isDense: true,
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8)),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: tts4B,
                onChanged: (val) {
                  setState(() {
                    assestInputtRequest[index].astprdate = val;
                  });
                },
                decoration: InputDecoration(
                  // suffix: InkWell(
                  //   onTap: () {
                  //     showcalander();
                  //   },
                  //   child: Card(
                  //     color: appColorG.withOpacity(0.8),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(2.0),
                  //       child: Text(
                  //         'Select The Date',
                  //         style: tts2W,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  hintText: 'DD-MM-YYYY',
                  hintStyle: tts4GY,
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // readOnly: true,
                style: tts4B,

                onChanged: (val) {
                  setState(() {
                    assestInputtRequest[index].astWard = int.tryParse(val);
                  });
                },

                decoration: InputDecoration(
                  hintText: 'Asset ward',
                  hintStyle: tts4GY,
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    imagePicker
                        .pickImage(source: ImageSource.camera)
                        .then((value) {
                      setState(() {
                        assestInputtRequest[index].astimage = value!.path;
                      });
                      debugPrint(assestInputtRequest[index].astimage);
                    });
                  },
                  child: assestInputtRequest[index].astimage == null
                      ? Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: MediaQuery.of(context).size.width / 1.0,
                            width: MediaQuery.of(context).size.width / 1.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border(
                                bottom: BorderSide(color: appColorG, width: 3),
                                top: BorderSide(color: appColorG, width: 3),
                                left: BorderSide(color: appColorG, width: 3),
                                right: BorderSide(color: appColorG, width: 3),
                              ),
                              shape: BoxShape.rectangle,
                              color: appColorW,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.add_a_photo_outlined,
                                  size: 50,
                                  color: appColorG,
                                ),
                                Text('Click Here to Add Photo')
                              ],
                            ),
                            padding: const EdgeInsets.all(8.0),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: MediaQuery.of(context).size.width / 1.0,
                            width: MediaQuery.of(context).size.width / 1.35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: const Border(
                                bottom: BorderSide(color: appColorG, width: 3),
                                top: BorderSide(color: appColorG, width: 3),
                                left: BorderSide(color: appColorG, width: 3),
                                right: BorderSide(color: appColorG, width: 3),
                              ),

                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: FileImage(File(
                                    assestInputtRequest[index]
                                        .astimage
                                        .toString(),
                                  ))),
                              shape: BoxShape.rectangle,
                              // color: Colors.black12,
                            ),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  'Uploaded',
                                  style: tts4W,
                                ),
                              ],
                            )),
                            padding: const EdgeInsets.all(8.0),
                          ))),
            ),
          ],
        ));
  }

  List<AssestInsertRequest> assestInputtRequest = [
    AssestInsertRequest(),
  ];
  // Future showcalander() async {
  //   final initialDate = DateTime.now();
  //   final newDate = await showDatePicker(
  //       context: context,
  //       initialDate: sDate ?? initialDate,
  //       firstDate: DateTime(DateTime.now().year - 15),
  //       lastDate: DateTime(DateTime.now().year + 15));
  //   if (newDate == null) return;
  //   setState(() => sDate = newDate);
  //   debugPrint(sDate.toString());
  //   dateCtl.text = '${sDate!.day}-${sDate!.month}-${sDate!.year}';
  //   datetime = '${sDate!.day}-${sDate!.month}-${sDate!.year}';
  // }

  buildTable() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
              style: BorderStyle.solid,
              width: 1),
          children: [
            TableRow(children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Text(
                        'Sl No',
                        style: tts3G,
                      ),
                    )
                  ]),
              Column(children: const [
                Text(
                  'Property',
                  style: tts3G,
                )
              ]),
              Column(children: const [
                Text(
                  'Number',
                  style: tts3G,
                )
              ]),
            ]),
            TableRow(
                decoration: BoxDecoration(color: appColorG.withOpacity(0.4)),
                children: [
                  Column(children: const [
                    Text(
                      '1',
                      style: tts4B,
                    )
                  ]),
                  Column(children: const [
                    Text(
                      'Table',
                      style: tts4B,
                    )
                  ]),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(),
                    )
                  ]),
                ]),
            TableRow(children: [
              Column(children: const [
                Text(
                  '2',
                  style: tts4B,
                )
              ]),
              Column(children: const [
                Text(
                  'Fan',
                  style: tts4B,
                )
              ]),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(),
                )
              ]),
            ]),
            TableRow(
                decoration: BoxDecoration(color: appColorG.withOpacity(0.4)),
                children: [
                  Column(children: const [
                    Text(
                      '3',
                      style: tts4B,
                    )
                  ]),
                  Column(children: const [
                    Text(
                      'Chair',
                      style: tts4B,
                    )
                  ]),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(),
                    )
                  ]),
                ]),
          ]),
    );
  }

  buildBNB(index) {
    return Container(
      height: 45,
      color: appColorG,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              // if (assestInputtRequest[index - 1].astName == null) {
              //   showFlutterTost('Enter the Asset Name');
              // } else if (assestInputtRequest[index - 1].astDesc == null) {
              //   showFlutterTost('Enter the Asset Desc');
              // } else if (assestInputtRequest[index - 1].astCat == null) {
              //   showFlutterTost('Enter the Asset Cat');
              // } else if (assestInputtRequest[index - 1].astQty == null) {
              //   showFlutterTost('Enter the Asset Qty');
              // } else if (assestInputtRequest[index - 1].astCondition == null) {
              //   showFlutterTost('Enter the Asset Condition');
              // } else if (assestInputtRequest[index - 1].astRemarks == null) {
              //   showFlutterTost('Enter the Asset Remarks');
              // } else if (assestInputtRequest[index - 1].astprdate == null) {
              //   showFlutterTost('Enter the Asset Pr Date');
              // } else if (assestInputtRequest[index - 1].astWard == null) {
              //   showFlutterTost('Enter the Asset Ward');
              // } else if (assestInputtRequest[index - 1].astimage == null) {
              //   showFlutterTost('Upload the photo');
              // } else {
              apiServices.assectInsert(assestInputtRequest).then((value) async {
                debugPrint(value.toString());
                if (value["status"] == true) {
                  showFlutterTost(value['message'].toString());
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'HomePage', (route) => false);
                } else {
                  showFlutterTost('Something went wrong');
                }
              });
              // }
            },
            child: CusTextButton('Submit'),
          )
        ],
      ),
    );
  }
}
