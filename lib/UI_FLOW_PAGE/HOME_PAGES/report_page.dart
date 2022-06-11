import 'package:asset_management/UTILS/color_const.dart';
import 'package:asset_management/UTILS/text_const.dart';
import 'package:asset_management/UTILS/text_style_const.dart';
import 'package:flutter/material.dart';



class RepoetPage extends StatefulWidget {
  const RepoetPage({Key? key}) : super(key: key);

  @override
  State<RepoetPage> createState() => _RepoetPageState();
}

class _RepoetPageState extends State<RepoetPage> {
  @override
  Widget build(BuildContext context) {
    // if (reportResp == null) {
    //   getReportData();
    // }
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(),
        body:
            //  reportResp == null
            // ? const Center(child: CircularProgressIndicator())
            buildBody(),

        // bottomNavigationBar: bNB(),
      ),
    );
  }

  buildAppbar() {
    return AppBar(
      backgroundColor: appColorW,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      title: Text(
        report,
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

  // bNB() {
  //   return NumberPaginator(
  //     buttonSelectedBackgroundColor:
  //         Colors.deepPurple.shade900.withOpacity(0.9),
  //     numberPages: _numPages,
  //     onPageChange: (int index) {
  //       setState(() {
  //         _currentPage = index + 1;
  //         getReportData();
  //       });
  //     },
  //   );
  // }

  buildBody() {
    return SingleChildScrollView(
      child: buildTable(),
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
                  Column(children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('10'),
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
              Column(children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('2'),
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
                  Column(children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('5'),
                    )
                  ]),
                ]),
          ]),
    );
  }

  // Widget buildDataTable() {
  //   final columns = [
  //     'Id', //1
  //     'Vehicle No', //2
  //     'Date and Time', //3
  //     'HSD', //4
  //     'MS', //5
  //     'Coolant', //6
  //     'Uria', //7
  //     'Initial Meter Reading', //8
  //     'Final Meter Reading', //9
  //     'Mileage Of Vehical', //10
  //     'Purpose Of Deploy', //11
  //     'Type Of Vehicle ', //12
  //     // 'Doc copy', //13
  //   ];
  //   final rows = [
  //     'Id', //1
  //     'Vehicle No', //2
  //     'Date and Time', //3
  //     'HSD', //4
  //     'MS', //5
  //     'Coolant', //6
  //     'Uria', //7
  //     'Initial Meter Reading', //8
  //     'Final Meter Reading', //9
  //     'Mileage Of Vehical', //10
  //     'Purpose Of Deploy', //11
  //     'Type Of Vehicle ', //12
  //     // 'Doc copy', //13
  //   ];

  //   return DataTable(
  //     columns: getColumns(columns),
  //     rows: getRows(reportResp!.data!.reports,),
  //   );
  // }

  // List<DataColumn> getColumns(List<String> columns) => columns
  //     .map((String column) => DataColumn(
  //           label: Text(
  //             column,
  //             style: tts6B,
  //           ),
  //         ))
  //     .toList();

  // // List<DataRow> getRows(List<String> rows) => rows
  // //     .map((String rows) => DataRow(
  // //           label: Text(
  // //             rows,
  // //             style: tts6B,
  // //           ),
  // //         ))
  // //     .toList();

  // List<DataRow> getRows(List<Reports>? reports) =>
  //     reports!.map((Reports reports) {
  //       final cells = [
  //         reports.id, //1
  //         reports.name, //2
  //         reports.byeLaneNoAndName, //3
  //         reports.houseNo, //5
  //         reports.mobileNo, //4
  //         reports.measurement, //10
  //         reports.newAssessment, //6
  //         reports.reAssessment, //11
  //         reports.wardNo, //9
  //         reports.area, //8
  //         reports.feedback, //7
  //         reports.docCopy, //13
  //         // reports.holdingNo, //12
  //       ];

  //       return DataRow(cells: getCells(cells, reports));
  //     }).toList();

  // List<DataCell> getCells(List<dynamic> cells, reports) => cells
  //     .map((data) => DataCell(
  //           InkWell(
  //             child: Text(
  //               '$data',
  //               style: tts5B,
  //             ),
  //           ),
  //           //   onTap: () {
  //           // if ("$data" == reports!.id) {
  //           //   _reportDetaile('$data');
  //           // } else {
  //           //   showFlutterTost('click on Report Id ');
  //           // }
  //           // }
  //         ))
  //     .toList();

  // // _reportDetaile(String repId) {
  // //   return Navigator.pushNamed(context, 'DetaileReportPage', arguments: repId);
  // // }
}
