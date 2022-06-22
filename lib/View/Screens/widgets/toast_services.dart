
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

void showErrorNotification(
  BuildContext context,
  subtitle,
) {
  showSimpleNotification(const Text(""),
      subtitle: Text(subtitle,
          ),
      background: Colors.red);
}

void showSuccessNotification(
  BuildContext context,
  String hearding,
  subtitle,
) {
  showSimpleNotification(const Text(""),
      subtitle: Text(subtitle,
         ),
      background: Colors.green);
}