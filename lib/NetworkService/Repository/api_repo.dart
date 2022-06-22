import 'package:flutter/material.dart';
import 'package:interviewtask/NetworkService/Services/api_service.dart';
import 'package:interviewtask/NetworkService/Services/base_service.dart';

class ApiRepository {
  final BaseService _service = ApiService();

  Future<dynamic> getAppointmentRepo(BuildContext context,userName, password, date, mainUrl) async {
    dynamic response = await _service.getAppointmentApi(context,userName, password, date, mainUrl);
    return response;
  }
}
