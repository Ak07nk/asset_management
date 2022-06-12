import 'dart:convert';
import 'dart:developer';
import 'package:asset_management/API_FILES/MODEL_CLASSES/report_model.dart';
import 'package:asset_management/API_FILES/api_calls.dart';
import 'package:asset_management/UTILS/color_const.dart';
import 'package:asset_management/UTILS/text_const.dart';
import 'package:asset_management/UTILS/text_style_const.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  int? sortColumnIndex;
  bool isAscending = true;
  ReportResponse? reportResp;

  void initstate() {
    super.initState();
    getReportData();
  }

  getReportData() async {
    apiServices.reports().then((value) {
      setState(() {
        reportResp = value;
      });
      log(json.encode(reportResp.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (reportResp == null) {
      getReportData();
    }
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(),
        body: reportResp == null
            ? const Center(child: CircularProgressIndicator())
            : buildBody(),
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
        reports,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
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
          ),
        ],
      ),
    );
  }

  Widget buildDataTable() {
    final columns = [
      'Asset Id',
      'Asset Name',
      'Asset Qty',
      'Asset PrDate',
      // 'Asset Desc',
      // 'Asset Cat',
      // 'Asset Condition',
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
          reportResp!.data!.reports,
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

  List<DataRow> getRows(List<Reports>? reports) =>
      reports!.map((Reports reports) {
        final cells = [
          reports.id,
          reports.astName,
          reports.astQty,
          reports.astPrDate,
          // reports.astDesc,
          // reports.astCat,
          // reports.astCondition,
          // reports.astWard,
          // reports.astRemarks,
        ];

        return DataRow(cells: getCells(cells, reports));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells, reports) => cells
      .map((data) => DataCell(
            Container(
              alignment: Alignment.center,
              child: Text(
                '$data',
                style: tts3B,
              ),
            ),
            //      onTap: () {
            //   if ("$data" == reports!.id) {
            //     _reportDetaile('$data');
            //   } else {
            //     showFlutterTost('click on Report Id ');
            //   }
            // }
          ))
      .toList();

  // _reportDetaile(String repId) {
  //   return Navigator.pushNamed(context, 'DetaileReportPage', arguments: repId);
  // }

  // @override
  // void dispose() {
  //   getReportData();
  //   super.dispose();
  // }
}
