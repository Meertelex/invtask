import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:interviewtask/NetworkService/Services/base_service.dart';
import 'package:interviewtask/Resources/string_mager.dart';
import 'package:interviewtask/View/Screens/widgets/alert_dialogues.dart';
import 'package:interviewtask/View/Screens/widgets/toast_services.dart';

import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart' as http;

class ApiService extends BaseService {
  @override
  Future getAppointmentApi(BuildContext context, userName, password, date, mainUrl) async {
    dynamic jsonResponse;
    Uri url = Uri.parse(mainUrl + StringManager.endPoint);
    final xmlFormer = Xml2Json();
    var body =
        "<GetAppointmentDetails><SLUsername>$userName</SLUsername><SLPassword>$password</SLPassword><CurrentDate>$date</CurrentDate></GetAppointmentDetails>";
    Map<String, String> headers = {"Accept": "text/html,application/xml"};
    try {
      final response = await http.post(url, body: body, headers: headers);
      var data = response.body;
      xmlFormer.parse(data);
      var json = xmlFormer.toGData();
      jsonResponse = jsonDecode(json);

    
    } catch (e) {
    
     showErrorNotification(context, e.toString());
     
    }
    return jsonResponse;
  }
}
