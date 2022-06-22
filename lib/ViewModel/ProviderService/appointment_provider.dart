import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interviewtask/NetworkService/Repository/api_repo.dart';
import 'package:interviewtask/View/Screens/widgets/alert_dialogues.dart';
import 'package:interviewtask/View/Screens/widgets/toast_services.dart';
import 'package:interviewtask/models/appointment_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AppointmentProvider extends ChangeNotifier {
 
  
  List<Appointment>? appointment=[];
  var titleBarName;
  Future<List<Appointment>?> getAppointmentProvider(BuildContext context, userName, password, date, mainUrl) async {
    Dialogs.loadingDialogue(context:context, subHeading: "Please wait...");
    var response = await ApiRepository().getAppointmentRepo(context, userName, password, date, mainUrl);
    Navigator.pop(context);

    if (response != null) {

      if(response['Response']['Appointments']['Appointment']!=null){  
        titleBarName = response['Response']['Defaults']['FullName']['\u0024t'];  
        appointment = (response['Response']['Appointments']['Appointment'] as List).map((item) => Appointment.fromJson(item)).toList(); 
        notifyListeners();
            if(response['Response']["ResponseCode"]['\u0024t']=="SC0001"){
        showSuccessNotification(context, "", "Refresh Completed");
      }else{
         var msg = response['Response']['ResponseDescription']['\u0024t'];
         showErrorNotification(context,msg );
      }
      }else{
        appointment=[];
        notifyListeners();
         var msg = response['Response']['ResponseDescription']['\u0024t'];
         showErrorNotification(context, msg );
        
      }
    
      
      
    } 

    return appointment;
  }


  launchURL(url) async {
final String encodedURl = Uri.encodeFull(url);

    // ignore: deprecated_member_use
    if (await canLaunch(encodedURl)) {
      // ignore: deprecated_member_use
      await launch(encodedURl);
    } else {
      print('Could not launch $encodedURl');
      throw 'Could not launch $encodedURl';
    }
  }
}
