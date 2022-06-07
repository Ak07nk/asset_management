import 'dart:convert';
import 'dart:developer';
import 'package:asset_management/API_FILES/api_links.dart';
import 'package:asset_management/STATELESS_WIDGET/flutter_tost.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'MODEL_CLASSES/assest_insert_model.dart';
import 'MODEL_CLASSES/login_model.dart';

ApiServices apiServices = ApiServices();

var client = http.Client();

class ApiServices {
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
    log(input.toString());
    // Map<String, String> imaGe = {};
    // for (var i = 0; i < assestInsertRequests.length; i++) {
    //   imaGe['ast_image[]'] = assestInsertRequests[i].astimage.toString();
    // }
    var request = http.MultipartRequest("POST", assestLink);
    request.headers.addAll(headerSs);
    request.fields.addAll(input);
    request.files.addAll(
      List.generate(
        assestInsertRequests.length,
        (index) => http.MultipartFile.fromString(
            'ast_image[]', assestInsertRequests[index].astimage.toString()),
      ),
    );
    debugPrint(assestInsertRequests[0].astimage);
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
}
