import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:asset_management/API_FILES/MODEL_CLASSES/const_repid_model.dart';
import 'package:asset_management/API_FILES/MODEL_CLASSES/const_report_model.dart';
import 'package:asset_management/API_FILES/MODEL_CLASSES/cosnt_insert_model.dart';
import 'package:asset_management/API_FILES/MODEL_CLASSES/imMovablerepid_model.dart';
import 'package:asset_management/API_FILES/MODEL_CLASSES/immove_insert_model.dart';
import 'package:asset_management/API_FILES/MODEL_CLASSES/immoveable_report_model.dart';
import 'package:asset_management/API_FILES/MODEL_CLASSES/profile_model.dart';
import 'package:asset_management/API_FILES/MODEL_CLASSES/register_model.dart';
import 'package:asset_management/API_FILES/MODEL_CLASSES/report_model.dart';
import 'package:asset_management/API_FILES/api_links.dart';
import 'package:asset_management/STATELESS_WIDGET/flutter_tost.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'MODEL_CLASSES/move_insert_model.dart';
import 'MODEL_CLASSES/login_model.dart';

ApiServices apiServices = ApiServices();

var client = http.Client();

class ApiServices {
  String? userIds;
  String? userRIds;

  Future<dynamic> login(LoginRequest loginRequest) async {
    Map<String, String> headerss = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Basic dGFwYXBwOjEyMzQ="
    };
    var loginLink = Uri.parse(
      baseUrl + loginUrl,
    );
    var bodyy = jsonEncode({
      'X-API-KEY': loginRequest.xAPIKEY.toString(),
      'email': loginRequest.email.toString(),
      'password': loginRequest.password.toString()
    });
    // try {
    var respond = await client.post(loginLink, headers: headerss, body: bodyy);

    if (respond.statusCode == 500) {
      log((respond.reasonPhrase.toString()));
      showFlutterTost(respond.reasonPhrase.toString());
    } else if (respond.statusCode == 401) {
      showFlutterTost(respond.reasonPhrase.toString());
    } else if (respond.statusCode == 400) {
      showFlutterTost(respond.body.toString());
    } else if (respond.statusCode == 200) {
      String values = respond.body.toString();
      log(values);

      Map<String, dynamic> jsonResponse = json.decode(values);
      if (jsonResponse.isNotEmpty) {
        // ignore: avoid_print
        print("LoginResp:::>" + jsonResponse.toString());
        return jsonResponse;
      }
      if (jsonResponse['status'] == false) {
        showFlutterTost(jsonResponse['msg']);
      }
    }
  }

//********************************************************************************Assest_insert */
  Future<dynamic> register(RegisterReq registerReq) async {
    Map<String, String> headerss = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Basic dGFwYXBwOjEyMzQ=",
      'X-API-KEY': "PTAX@123"
    };
    var registerLink = Uri.parse(
      baseUrl + registerUrl,
    );
    var bodyy = jsonEncode({
      // 'X-API-KEY': loginRequest.xAPIKEY.toString(),
      'first_name': registerReq.firstName.toString(),
      'last_name': registerReq.lastName.toString(),
      'phone': registerReq.phone.toString(),
      'role': registerReq.role.toString(),
      'email': registerReq.email.toString(),
      'password': registerReq.password.toString()
    });
    // try {
    var respond =
        await client.post(registerLink, headers: headerss, body: bodyy);

    if (respond.statusCode == 500) {
      log((respond.reasonPhrase.toString()));
      showFlutterTost(respond.reasonPhrase.toString());
    } else if (respond.statusCode == 401) {
      showFlutterTost(respond.reasonPhrase.toString());
    } else if (respond.statusCode == 400) {
      showFlutterTost(respond.body.toString());
    } else if (respond.statusCode == 200) {
      String values = respond.body.toString();
      log(values);

      Map<String, dynamic> jsonResponse = json.decode(values);
      if (jsonResponse.isNotEmpty) {
        // ignore: avoid_print
        print("RegisterResp:::>" + jsonResponse.toString());
        return jsonResponse;
      }
      if (jsonResponse['status'] == false) {
        showFlutterTost(jsonResponse['msg']);
      }
    }
  }

//********************************************************************************Assest_insert */

  Future<dynamic> assectInsert(
      List<AssestInsertRequest> assestInsertRequests) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userIDs;
    userIDs = prefs.getString("Uid");
    var assestLink = Uri.parse(
      baseUrl + assestInsertUrl,
    );
    String userNamEE = 'tapapp';
    String passWorDD = '1234';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$userNamEE:$passWorDD'));
    debugPrint(basicAuth);
    Map<String, String> headerSs = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": basicAuth,
      'X-API-KEY': "PTAX@123"
    };

    Map<String, String> input = {};
    for (var i = 0; i < assestInsertRequests.length; i++) {
      input['item[$i][ast_name]'] = assestInsertRequests[i].astName.toString();
      input['item[$i][ast_desc]'] = assestInsertRequests[i].astDesc.toString();
      input['item[$i][ast_cat]'] = assestInsertRequests[i].astCat.toString();
      input['item[$i][ast_qty]'] = assestInsertRequests[i].astQty.toString();
      input['item[$i][ast_condition]'] =
          assestInsertRequests[i].astCondition.toString();
      input['item[$i][ast_remarks]'] =
          assestInsertRequests[i].astRemarks.toString();
      input['item[$i][created_by]'] = userIDs!;
      input['item[$i][ast_ward]'] = assestInsertRequests[i].astWard.toString();
      input['item[$i][ast_pr_date]'] =
          assestInsertRequests[i].astprdate.toString();
    }
    log(jsonEncode(input.toString()));
    var request = http.MultipartRequest("POST", assestLink);
    request.headers.addAll(headerSs);
    request.fields.addAll(input);
    for (var i = 0; i < assestInsertRequests.length; i++) {
      request.files.add(await http.MultipartFile.fromPath(
          'ast_image[]', assestInsertRequests[i].astimage!));
      log(jsonEncode(assestInsertRequests[i].astimage.toString()));
    }
    http.StreamedResponse respond = await request.send();
    if (respond.statusCode == 500) {
      log((respond.reasonPhrase.toString()));
      showFlutterTost(respond.reasonPhrase.toString());
    } else if (respond.statusCode == 401) {
      showFlutterTost(respond.reasonPhrase.toString());
    } else if (respond.statusCode == 400) {
      showFlutterTost(respond.stream.toString());
    } else if (respond.statusCode == 200) {
      String values = await respond.stream.bytesToString();
      log(values.toString());
      Map<String, dynamic> jsonResponse = json.decode(values);
      if (jsonResponse.isNotEmpty) {
        // ignore: avoid_print
        debugPrint("Assect Insert:::>" + jsonResponse.toString());
        return jsonResponse;
      }
      // if (jsonResponse['status'] == false) {
      //   showFlutterTost(jsonResponse['msg']);
      // }
    }
  }

//********************************************************************************Assest_Report */
  Future<dynamic> imMoveablassectInsert(
      List<ImMoveableAssetRequest> imMoveableAssetRequest) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userIDs;
    userIDs = prefs.getString("Uid");
    var assestLink = Uri.parse(
      baseUrl + imMoveablassestInsertUrl,
    );
    String userNamEE = 'tapapp';
    String passWorDD = '1234';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$userNamEE:$passWorDD'));
    debugPrint(basicAuth);
    Map<String, String> headerSs = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": basicAuth,
      'X-API-KEY': "PTAX@123"
    };

    Map<String, String> input = {};
    for (var i = 0; i < imMoveableAssetRequest.length; i++) {
      input['item[$i][ast_name]'] =
          imMoveableAssetRequest[i].astName.toString();
      input['item[$i][ast_desc]'] =
          imMoveableAssetRequest[i].astDesc.toString();
      input['item[$i][ast_cat]'] = imMoveableAssetRequest[i].astCat.toString();
      input['item[$i][ast_qty]'] = imMoveableAssetRequest[i].astQty.toString();
      input['item[$i][ast_condition]'] =
          imMoveableAssetRequest[i].astCondition.toString();
      input['item[$i][ast_remarks]'] =
          imMoveableAssetRequest[i].astRemarks.toString();
      input['item[$i][created_by]'] = userIDs!;
      input['item[$i][ast_ward]'] =
          imMoveableAssetRequest[i].astWard.toString();
      input['item[$i][ast_address]'] =
          imMoveableAssetRequest[i].astaddress.toString();
      input['item[$i][ast_pincode]'] =
          imMoveableAssetRequest[i].astpincode.toString();
      input['item[$i][ast_pr_date]'] =
          imMoveableAssetRequest[i].astprdate.toString();
    }
    log(jsonEncode(input.toString()));
    var request = http.MultipartRequest("POST", assestLink);
    request.headers.addAll(headerSs);
    request.fields.addAll(input);
    for (var i = 0; i < imMoveableAssetRequest.length; i++) {
      request.files.add(await http.MultipartFile.fromPath(
          'ast_image[]', imMoveableAssetRequest[i].astimage!));
      log(jsonEncode(imMoveableAssetRequest[i].astimage.toString()));
    }
    http.StreamedResponse respond = await request.send();
    if (respond.statusCode == 500) {
      log((respond.reasonPhrase.toString()));
      showFlutterTost(respond.reasonPhrase.toString());
    } else if (respond.statusCode == 401) {
      showFlutterTost(respond.reasonPhrase.toString());
    } else if (respond.statusCode == 400) {
      showFlutterTost(respond.stream.toString());
    } else if (respond.statusCode == 200) {
      String values = await respond.stream.bytesToString();
      log(values.toString());
      Map<String, dynamic> jsonResponse = json.decode(values);
      if (jsonResponse.isNotEmpty) {
        // ignore: avoid_print
        debugPrint("Assect Insert:::>" + jsonResponse.toString());
        return jsonResponse;
      }
      // if (jsonResponse['status'] == false) {
      //   showFlutterTost(jsonResponse['msg']);
      // }
    }
  }

//********************************************************************************Assest_Report */
  Future<dynamic> constassectInsert(
      List<ConstructionAssetRequest> constructionAssetRequest) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userIDs;
    userIDs = prefs.getString("Uid");
    var assestLink = Uri.parse(
      baseUrl + consAssestReportIdUrl,
    );
    String userNamEE = 'tapapp';
    String passWorDD = '1234';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$userNamEE:$passWorDD'));
    debugPrint(basicAuth);
    Map<String, String> headerSs = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": basicAuth,
      'X-API-KEY': "PTAX@123"
    };

    Map<String, String> input = {};
    for (var i = 0; i < constructionAssetRequest.length; i++) {
      input['item[$i][ast_name]'] =
          constructionAssetRequest[i].astName.toString();
      input['item[$i][ast_desc]'] =
          constructionAssetRequest[i].astDesc.toString();
      input['item[$i][ast_cat]'] =
          constructionAssetRequest[i].astCat.toString();
      input['item[$i][ast_qty]'] =
          constructionAssetRequest[i].astQty.toString();
      input['item[$i][ast_condition]'] =
          constructionAssetRequest[i].astCondition.toString();
      input['item[$i][ast_remarks]'] =
          constructionAssetRequest[i].astRemarks.toString();
      input['item[$i][created_by]'] = userIDs!;
      input['item[$i][ast_ward]'] =
          constructionAssetRequest[i].astWard.toString();
      input['item[$i][ast_address]'] =
          constructionAssetRequest[i].astaddress.toString();
      input['item[$i][ast_pincode]'] =
          constructionAssetRequest[i].astpincode.toString();
      input['item[$i][ast_pr_date]'] =
          constructionAssetRequest[i].astprdate.toString();
      input['item[$i][ast_cons_stage]'] =
          constructionAssetRequest[i].astconsstage.toString();
    }
    log(jsonEncode(input.toString()));
    var request = http.MultipartRequest("POST", assestLink);
    request.headers.addAll(headerSs);
    request.fields.addAll(input);
    for (var i = 0; i < constructionAssetRequest.length; i++) {
      request.files.add(await http.MultipartFile.fromPath(
          'ast_image[]', constructionAssetRequest[i].astimage!));
      log(jsonEncode(constructionAssetRequest[i].astimage.toString()));
    }
    http.StreamedResponse respond = await request.send();
    if (respond.statusCode == 500) {
      log((respond.reasonPhrase.toString()));
      showFlutterTost(respond.reasonPhrase.toString());
    } else if (respond.statusCode == 401) {
      showFlutterTost(respond.reasonPhrase.toString());
    } else if (respond.statusCode == 400) {
      showFlutterTost(respond.stream.toString());
    } else if (respond.statusCode == 200) {
      String values = await respond.stream.bytesToString();
      log(values.toString());
      Map<String, dynamic> jsonResponse = json.decode(values);
      if (jsonResponse.isNotEmpty) {
        // ignore: avoid_print
        debugPrint("Assect Insert:::>" + jsonResponse.toString());
        return jsonResponse;
      }
      // if (jsonResponse['status'] == false) {
      //   showFlutterTost(jsonResponse['msg']);
      // }
    }
  }

//********************************************************************************Assest_Report */
  Future<dynamic> reports() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userIds = prefs.getString("Uid");
    var reportlink = Uri.parse(baseUrl + assestReportUrl + userIds!);
    print("ReportGet:::>" + reportlink.toString());
    String userNamEE = 'tapapp';
    String passWorDD = '1234';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$userNamEE:$passWorDD'));
    debugPrint(basicAuth);
    Map<String, String> headerSs = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": basicAuth,
      'X-API-KEY': "PTAX@123"
    };
    var request = http.MultipartRequest("Get", reportlink);
    request.headers.addAll(headerSs);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 500) {
      showFlutterTost(response.reasonPhrase.toString());
    } else if (response.statusCode == 404) {
      showFlutterTost(response.reasonPhrase.toString());
    } else if (response.statusCode == 200) {
      String values = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = jsonDecode(values);
      if (jsonResponse['status'] == true) {
        ReportResponse reportResponse = ReportResponse.fromMap(jsonResponse);
        // ignore: avoid_print
        print(reportResponse);
        return ReportResponse.fromMap(jsonResponse);
      }
      if (jsonResponse['status'] == false) {
        showFlutterTost(jsonResponse['msg']);
      }
    }
  }

//********************************************************************************Assest_Report */
  Future<dynamic> immovablereports() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userRIds;
    userRIds = prefs.getString("Uid");
    var reportlink = Uri.parse(baseUrl + immoveableassestReportUrl + userRIds!);
    print("ReportGet:::>" + reportlink.toString());
    String userNamEE = 'tapapp';
    String passWorDD = '1234';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$userNamEE:$passWorDD'));
    debugPrint(basicAuth);
    Map<String, String> headerSs = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": basicAuth,
      'X-API-KEY': "PTAX@123"
    };
    var request = http.MultipartRequest("Get", reportlink);
    request.headers.addAll(headerSs);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 500) {
      showFlutterTost(response.reasonPhrase.toString());
    } else if (response.statusCode == 404) {
      showFlutterTost(response.reasonPhrase.toString());
    } else if (response.statusCode == 200) {
      String values = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = jsonDecode(values);
      if (jsonResponse['status'] == true) {
        ImMoveableReportResponse imMoveableReportResponse =
            ImMoveableReportResponse.fromMap(jsonResponse);
        // ignore: avoid_print
        print(imMoveableReportResponse);
        return ImMoveableReportResponse.fromMap(jsonResponse);
      }
      if (jsonResponse['status'] == false) {
        showFlutterTost(jsonResponse['msg']);
      }
    }
  }

//********************************************************************************Assest_Report */
  Future<dynamic> constreports() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userRIds;
    userRIds = prefs.getString("Uid");
    var reportlink = Uri.parse(baseUrl + constAssestReportUrl + userRIds!);
    print("ReportGet:::>" + reportlink.toString());
    String userNamEE = 'tapapp';
    String passWorDD = '1234';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$userNamEE:$passWorDD'));
    debugPrint(basicAuth);
    Map<String, String> headerSs = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": basicAuth,
      'X-API-KEY': "PTAX@123"
    };
    var request = http.MultipartRequest("Get", reportlink);
    request.headers.addAll(headerSs);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 500) {
      showFlutterTost(response.reasonPhrase.toString());
    } else if (response.statusCode == 404) {
      showFlutterTost(response.reasonPhrase.toString());
    } else if (response.statusCode == 200) {
      String values = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = jsonDecode(values);
      if (jsonResponse['status'] == true) {
        ConstructionReportRespon constructionReportRespon =
            ConstructionReportRespon.fromMap(jsonResponse);
        // ignore: avoid_print
        print(constructionReportRespon);
        return ConstructionReportRespon.fromMap(jsonResponse);
      }
      if (jsonResponse['status'] == false) {
        showFlutterTost(jsonResponse['msg']);
      }
    }
  }

//********************************************************************************Assest_Report */
  Future<dynamic> immovreportid(String? immoVrepID) async {
    var reportlink =
        Uri.parse(baseUrl + immoveableassestReportIdUrl + immoVrepID!);
    print("ReportGet:::>" + reportlink.toString());
    String userNamEE = 'tapapp';
    String passWorDD = '1234';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$userNamEE:$passWorDD'));
    debugPrint(basicAuth);
    Map<String, String> headerSs = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": basicAuth,
      'X-API-KEY': "PTAX@123"
    };
    var request = http.MultipartRequest("Get", reportlink);
    request.headers.addAll(headerSs);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 500) {
      showFlutterTost(response.reasonPhrase.toString());
    } else if (response.statusCode == 404) {
      showFlutterTost(response.reasonPhrase.toString());
    } else if (response.statusCode == 200) {
      String values = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = jsonDecode(values);
      log(values.toString());
      if (jsonResponse != null) {
        ImMovAblRepIdRespond imMovAblRepIdRespond =
            ImMovAblRepIdRespond.fromMap(jsonResponse);
        // ignore: avoid_print
        print(imMovAblRepIdRespond);
        return ImMovAblRepIdRespond.fromMap(jsonResponse);
      }
      if (jsonResponse['status'] == false) {
        showFlutterTost(jsonResponse['msg']);
      }
    }
  }

//********************************************************************************Assest_Report */
  Future<dynamic> contreportid(String? constrepID) async {
    var reportlink = Uri.parse(baseUrl + constassestReportIDUrl + constrepID!);
    print("ReportGet:::>" + reportlink.toString());
    String userNamEE = 'tapapp';
    String passWorDD = '1234';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$userNamEE:$passWorDD'));
    debugPrint(basicAuth);
    Map<String, String> headerSs = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": basicAuth,
      'X-API-KEY': "PTAX@123"
    };
    var request = http.MultipartRequest("Get", reportlink);
    request.headers.addAll(headerSs);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 500) {
      showFlutterTost(response.reasonPhrase.toString());
    } else if (response.statusCode == 404) {
      showFlutterTost(response.reasonPhrase.toString());
    } else if (response.statusCode == 200) {
      String values = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = jsonDecode(values);
      log(values.toString());
      if (jsonResponse != null) {
        ConstructionRepidRespond constructionRepidRespond =
            ConstructionRepidRespond.fromMap(jsonResponse);
        // ignore: avoid_print
        print(constructionRepidRespond);
        return ConstructionRepidRespond.fromMap(jsonResponse);
      }
      if (jsonResponse['status'] == false) {
        showFlutterTost(jsonResponse['msg']);
      }
    }
  }

//********************************************************************************Assest_Report */
  Future<dynamic> movreportid(String? moVrepID) async {
    var reportlink = Uri.parse(baseUrl + moveableassestReportIDUrl + moVrepID!);
    print("ReportGet:::>" + reportlink.toString());
    String userNamEE = 'tapapp';
    String passWorDD = '1234';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$userNamEE:$passWorDD'));
    debugPrint(basicAuth);
    Map<String, String> headerSs = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": basicAuth,
      'X-API-KEY': "PTAX@123"
    };
    var request = http.MultipartRequest("Get", reportlink);
    request.headers.addAll(headerSs);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 500) {
      showFlutterTost(response.reasonPhrase.toString());
    } else if (response.statusCode == 404) {
      showFlutterTost(response.reasonPhrase.toString());
    } else if (response.statusCode == 200) {
      String values = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = jsonDecode(values);
      log(values.toString());
      if (jsonResponse != null) {
        ImMovAblRepIdRespond imMovAblRepIdRespond =
            ImMovAblRepIdRespond.fromMap(jsonResponse);
        // ignore: avoid_print
        print(imMovAblRepIdRespond);
        return ImMovAblRepIdRespond.fromMap(jsonResponse);
      }
      if (jsonResponse['status'] == false) {
        showFlutterTost(jsonResponse['msg']);
      }
    }
  }

//********************************************************************************Assest_Report */
  Future<dynamic> getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userIDs;
    userIDs = prefs.getString("Uid");
    var profileLink = Uri.parse(
      baseUrl + getprofileUrl + userIDs!,
    );
    String userNamEE = 'tapapp';
    String passWorDD = '1234';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$userNamEE:$passWorDD'));
    debugPrint(basicAuth);
    Map<String, String> headerSs = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": basicAuth,
      'X-API-KEY': "PTAX@123"
    };
    var request = http.MultipartRequest("Get", profileLink);
    request.headers.addAll(headerSs);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 500) {
      showFlutterTost(response.reasonPhrase.toString());
    } else if (response.statusCode == 404) {
      showFlutterTost(response.reasonPhrase.toString());
    } else if (response.statusCode == 200) {
      String values = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = jsonDecode(values);
      log(values.toString());
      if (jsonResponse != null) {
        ProfileResp profileResp = ProfileResp.fromMap(jsonResponse);
        // ignore: avoid_print
        print(profileResp);
        return ProfileResp.fromMap(jsonResponse);
      }
      if (jsonResponse['status'] == false) {
        showFlutterTost(jsonResponse['msg']);
      }
    }
  }
}
