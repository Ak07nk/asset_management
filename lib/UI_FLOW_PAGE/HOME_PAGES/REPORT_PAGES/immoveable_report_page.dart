import 'dart:convert';
import 'dart:developer';
import 'package:asset_management/API_FILES/MODEL_CLASSES/immoveable_report_model.dart';
import 'package:asset_management/API_FILES/MODEL_CLASSES/report_model.dart';
import 'package:asset_management/API_FILES/api_calls.dart';
import 'package:asset_management/STATELESS_WIDGET/flutter_tost.dart';
import 'package:asset_management/UTILS/color_const.dart';
import 'package:asset_management/UTILS/text_const.dart';
import 'package:asset_management/UTILS/text_style_const.dart';
import 'package:flutter/material.dart';

class ImMoveableReport extends StatefulWidget {
  const ImMoveableReport({Key? key}) : super(key: key);

  @override
  _ImMoveableReportState createState() => _ImMoveableReportState();
}

class _ImMoveableReportState extends State<ImMoveableReport> {
  int? sortColumnIndex;
  bool isAscending = true;
  ImMoveableReportResponse? reportRespS;

  void initstate() {
    super.initState();
    getReportData();
  }

  getReportData() async {
    apiServices.immovablereports().then((value) {
      try {
        if (value != null) {
          setState(() {
            reportRespS = value;
          });
        }
      } catch (e) {
        if (value == null) {
          Text('No data');
        }
      }

      log(json.encode(reportRespS.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (reportRespS == null) {
      getReportData();
    }
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(),
        body: reportRespS == null
            ? const Center(child: CircularProgressIndicator())
            : buildBody(),
        bottomNavigationBar: note(),
      ),
    );
  }

  buildAppbar() {
    return AppBar(
      backgroundColor: appColorW,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      title: Text(
        reports,
        style: tts4G,
      ),
      titleSpacing: 15,
      centerTitle: false,
      shadowColor: appColorW,
      actions: [
        // IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.more_vert_rounded,
        //       size: 22,
        //       color: appColorG,
        //     ))
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
  note() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 25,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: Text(
          '• Click on SlNO to view the Individual Report In Detail •',
          style: tts3G,
        ),
      ),
    );
  }

  buildBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            buildDataTable(),
          ],
        ),
      ),
    );
  }

  Widget buildDataTable() {
    final columns = [
      'Sl No',
      'Asset Name',
      'Asset Qty',
      'Asset PrDate',
      'Asset Condition',
      'Asset Pincode',
      'Asset Address',
      // 'Asset Ward'
      // 'Asset Remarks', //9
    ];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DataTable(
        border: TableBorder.all(color: appColorG, width: 1),
        sortAscending: false,
        columns: getColumns(columns),
        rows: getRows(
          reportRespS!.data!.reports,
        ),
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Container(
              alignment: Alignment.center,
              child: Text(
                column,
                style: tts4G,
              ),
            ),
          ))
      .toList();

  List<DataRow> getRows(List<Reportss>? reportss) =>
      reportss!.map((Reportss reportss) {
        final cells = [
          reportss.id,
          reportss.astName,
          reportss.astQty,
          reportss.astPrDate,
          reportss.astCondition,
          reportss.astPincode,
          reportss.astAddress,
          // reports.astDesc,
          // reports.astCat,
          // reports.astWard,
          // reports.astRemarks,
        ];

        return DataRow(cells: getCells(cells, reportss));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells, reportss) => cells
      .map((data) => DataCell(
              Container(
                alignment: Alignment.center,
                child: Text(
                  '$data',
                  style: tts3B,
                ),
              ), onTap: () {
            if ("$data" == reportss!.id) {
              _reportDetaile('$data');
            } else {
              showFlutterTost('click on SlNo');
            }
          }))
      .toList();

  _reportDetaile(String repId) {
    return Navigator.pushNamed(context, 'IMmovreportId', arguments: repId);
  }

  // @override
  // void dispose() {
  //   getReportData();
  //   super.dispose();
  // }
}
