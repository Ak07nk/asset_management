import 'package:asset_management/UTILS/color_const.dart';
import 'package:asset_management/UTILS/text_style_const.dart';
import 'package:flutter/material.dart';

import '../STATELESS_WIDGET/flutter_tost.dart';
import '../STATELESS_WIDGET/text_button.dart';
import '../UTILS/size_const.dart';
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
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          dashBoardData(),
        ],
      ),
    );
  }

  dashBoardData() {
    return Column(
      children: [
        officedropDown(),
        expandedDropDown(),
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
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  contentPadding: EdgeInsets.all(5),
                  insetPadding: EdgeInsets.all(8),
                  // title: Container(
                  //   color: appColorB,
                  //   height: 50,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: Text('data'),
                  // ),
                  content: Column(
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
                        child: Row(
                          children: [
                            Radio(
                                activeColor: appColorG,
                                value: 10,
                                groupValue: 10,
                                onChanged: (int) {}),
                            Text(
                              'Office-A',
                              style: tts4B,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        // color: appColorG,
                        // height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Radio(
                                activeColor: appColorG,
                                value: 8,
                                groupValue: 10,
                                onChanged: (int) {}),
                            Text(
                              'Office-B',
                              style: tts4B,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        // color: appColorG,
                        // height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Radio(
                                activeColor: appColorG,
                                value: 5,
                                groupValue: 10,
                                onChanged: (int) {}),
                            Text(
                              'Office-C',
                              style: tts4B,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        // color: appColorG,
                        // height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Radio(
                                activeColor: appColorG,
                                value: 5,
                                groupValue: 10,
                                onChanged: (int) {}),
                            Text(
                              'Office-D',
                              style: tts4B,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        // color: appColorG,
                        // height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Radio(
                                activeColor: appColorG,
                                value: 5,
                                groupValue: 10,
                                onChanged: (int) {}),
                            Text(
                              'Office-E',
                              style: tts4B,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        // color: appColorG,
                        // height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Radio(
                                activeColor: appColorG,
                                value: 5,
                                groupValue: 10,
                                onChanged: (int) {}),
                            Text(
                              'Office-F',
                              style: tts4B,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        // color: appColorG,
                        // height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Radio(
                                activeColor: appColorG,
                                value: 5,
                                groupValue: 10,
                                onChanged: (int) {}),
                            Text(
                              'Office-G',
                              style: tts4B,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        // color: appColorG,
                        // height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Radio(
                                activeColor: appColorG,
                                value: 5,
                                groupValue: 10,
                                onChanged: (int) {}),
                            Text(
                              'Office-H',
                              style: tts4B,
                            ),
                          ],
                        ),
                      ),
                      dividerline(),
                    ],
                  ),
                  actions: [
                    Card(
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
                    Card(
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
                  ],
                ),
              );
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
          Card(
            elevation: 5,
            shadowColor: appColorG,
            child: ExpansionTile(
              initiallyExpanded: false,
              title: Text(
                'Information',
                style: tts5B,
              ),
              leading: Container(
                alignment: Alignment.center,
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: appColorG.withOpacity(0.7)),
                child: Text(
                  '1',
                  style: tts4W,
                ),
              ),
              children: [
                dividerline(),
                Container(
                  // height: 500,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          // readOnly: true,
                          style: tts4B,
                          decoration: InputDecoration(
                            hintText: 'Name',
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
                          decoration: InputDecoration(
                            hintText: 'Mobile No',
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
                          decoration: InputDecoration(
                            hintText: 'Pin Code',
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
                          maxLength: 500,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: 'Address',
                            hintStyle: tts4GY,
                            isDense: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                      dividerline(),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Option-A',
                                    style: tts3B,
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 10,
                                          groupValue: 10,
                                          onChanged: (int) {}),
                                      Text(
                                        'Yes',
                                        style: tts3B,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 0,
                                          groupValue: 10,
                                          onChanged: (int) {}),
                                      Text(
                                        'No',
                                        style: tts3B,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Option-B',
                                    style: tts3B,
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 0,
                                          groupValue: 10,
                                          onChanged: (int) {}),
                                      Text(
                                        'Yes',
                                        style: tts3B,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 10,
                                          groupValue: 10,
                                          onChanged: (int) {}),
                                      Text(
                                        'No',
                                        style: tts3B,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Option-C',
                                    style: tts3B,
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 0,
                                          groupValue: 10,
                                          onChanged: (int) {}),
                                      Text(
                                        'Yes',
                                        style: tts3B,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 0,
                                          groupValue: 10,
                                          onChanged: (int) {}),
                                      Text(
                                        'No',
                                        style: tts3B,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Option-D',
                                    style: tts3B,
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 0,
                                          groupValue: 10,
                                          onChanged: (int) {}),
                                      Text(
                                        'Yes',
                                        style: tts3B,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 0,
                                          groupValue: 10,
                                          onChanged: (int) {}),
                                      Text(
                                        'No',
                                        style: tts3B,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Option-E',
                                    style: tts3B,
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 0,
                                          groupValue: 10,
                                          onChanged: (int) {}),
                                      Text(
                                        'Yes',
                                        style: tts3B,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 0,
                                          groupValue: 10,
                                          onChanged: (int) {}),
                                      Text(
                                        'No',
                                        style: tts3B,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Option-F',
                                    style: tts3B,
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 0,
                                          groupValue: 10,
                                          onChanged: (int) {}),
                                      Text(
                                        'Yes',
                                        style: tts3B,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 0,
                                          groupValue: 10,
                                          onChanged: (int) {}),
                                      Text(
                                        'No',
                                        style: tts3B,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 5,
            shadowColor: appColorG,
            child: ExpansionTile(
              initiallyExpanded: false,
              title: Text(
                'Office Property Information',
                style: tts5B,
              ),
              leading: Container(
                alignment: Alignment.center,
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: appColorG.withOpacity(0.7)),
                child: Text(
                  '2',
                  style: tts4W,
                ),
              ),
              children: [
                dividerline(),
                Container(
                  child: buildTable(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

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

  // submitButt() {
  //   return Column(
  //     children: [
  //       InkWell(
  //         onTap: () {
  //           Navigator.pushNamedAndRemoveUntil(
  //               context, 'HomePage', (route) => true);
  //         },
  //         child: CusTextButton(
  //           'Submit',
  //         ),
  //       ),
  //     ],
  //   );
  // }

  buildBNB() {
    return Container(
      height: 50,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'HomePage', (route) => true);
              },
              child: CusTextButton('Submit')),
        ],
      ),
    );
  }
}
