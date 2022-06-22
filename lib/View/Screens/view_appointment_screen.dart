import 'package:flutter/material.dart';
import 'package:interviewtask/Models/appointment_model.dart';
import 'package:interviewtask/View/Screens/widgets/toast_services.dart';
import 'package:interviewtask/ViewModel/ProviderService/appointment_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as phoneLauncher;


class ViewAppointmentScreen extends StatefulWidget {
  const ViewAppointmentScreen({ Key? key }) : super(key: key);

  @override
  State<ViewAppointmentScreen> createState() => _ViewAppointmentScreenState();
}

class _ViewAppointmentScreenState extends State<ViewAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: _appBar(),
      body: _listOfAppointments(),
      
    );
  }

  AppBar _appBar(){
    return AppBar(
      elevation: 0.0,
      centerTitle: false,
      title: Consumer<AppointmentProvider>(
      builder: (context, data, child) {
          return Text(data.titleBarName.toString());
        }
      ),
    );
  }

  Widget _listOfAppointments(){
    return Consumer<AppointmentProvider>(
      builder: (context, data, child) {
        return ListView.builder(
          itemCount: data.appointment!.length,
          padding: EdgeInsets.fromLTRB(10,0,10,10),
          itemBuilder: (BuildContext context, int index, ){
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    apppointmentDetails(data, index),
                    _iconButtons(data, index),
                   
                   
                  ],
                ),

              ),
            );
          }
          );
      }
    );
  }


  Widget apppointmentDetails(AppointmentProvider data, int index ){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text("Customer Name",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                  
                ),
                
                ),
                

                Text("${data.appointment![index].customerDetails!.customerTitle!.t.toString()
                 +" "+ data.appointment![index].customerDetails!.customerForename!.t.toString() +" "+
                 data.appointment![index].customerDetails!.customerSurname!.t.toString()
                }",
                style: TextStyle(
                  fontSize: 13,
                   
                ),
                
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Customer Address",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                  
                ),
                
                ),

                Container(
                  child: Column(
                    children: [
                      Text(data.appointment![index].customerDetails!.customerCompanyName!.t.toString(),
                      style: TextStyle(
                        fontSize: 13,
                         
                      ),
                      
                      ),
                       Text(data.appointment![index].customerDetails!.customerBuildingName!.t.toString(),
                      style: TextStyle(
                        fontSize: 13,
                         
                      ),
                      
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),

                Text("Appointment Details",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                  
                ),
                
                ),

                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.appointment![index].warrantyDetails!.chargeType!.t.toString(),
                      style: TextStyle(
                        fontSize: 13,
                         
                      ),
                      
                      ),
                       Text(data.appointment![index].warrantyDetails!.jobType!.t.toString(),
                      style: TextStyle(
                        fontSize: 13,
                         
                      ),
                      
                      ),
                    ],
                  ),
                ),
      ],
    );
  }

  Widget _iconButtons(AppointmentProvider data, int index){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 20,
          width: 20,
          child: IconButton(
            onPressed: (){
              var postCode = data.appointment![index].customerDetails!.customerPostcode!.t.toString();
              if(postCode !=null){
                    String postCodeUrl = "https://www.google.com/maps/search/?api=1&query=$postCode";
              data.launchURL(postCodeUrl);

              }else{
                showErrorNotification(context, "Post code not available");
              }
            
        
            }, icon: Icon(Icons.map, size: 15,),
            ),
        ),
        SizedBox(
          width: 5,
        ),
           SizedBox(
            height: 20,
            width: 20,
             child: IconButton(
                     onPressed: (){
                       var mobileNumber = data.appointment![index].customerDetails!.customerMobileNo!.t.toString();
                       if(mobileNumber!= null){
                         // ignore: deprecated_member_use
                       phoneLauncher.launch('tel:+$mobileNumber');

                       }else{
                        showErrorNotification(context, "Phone number not available");
                       }
                      
                     }, icon: Icon(Icons.call, size: 15,),
                     ),
           )
      ],
    );
  }
}