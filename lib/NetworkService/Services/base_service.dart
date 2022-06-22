import 'package:flutter/material.dart';

abstract class BaseService {
  Future<dynamic> getAppointmentApi(BuildContext context, userName, password, date, mainUrl);
}
