import 'package:flutter/material.dart';
import 'package:interviewtask/View/Screens/setting_screen.dart';
import 'package:interviewtask/View/Screens/view_appointment_screen.dart';
import 'package:interviewtask/View/Screens/widgets/toast_services.dart';
import 'package:interviewtask/ViewModel/ProviderService/appointment_provider.dart';
import 'package:interviewtask/ViewModel/ProviderService/stored_data_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StoredDataProvider? storedDataProvider;
  AppointmentProvider? appointmentProvider;

  @override
  void initState() {
      appointmentProvider =
        Provider.of<AppointmentProvider>(context, listen: false);
   
    // TODO: implement initState
    storedDataProvider = Provider.of<StoredDataProvider>(context, listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
      
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buttonScreen()

        ],
      ),
    );
  }

  AppBar _appBar(){
    return AppBar(
      elevation: 0.0,
      title: Text("Home"),
    );
  }

  Widget _buttonScreen(){
    return Consumer<StoredDataProvider>(
      builder: (context, data, child) {
        return Column(
          children: [
            button(1, "Settings", (){
               buttonFunction(1, data );
            }),
            SizedBox(
              height: 10,
            ),
            button(2, "Refresh Data",(){buttonFunction(2, data);}),
             SizedBox(
              height: 10,
            ),
            button(3, "View Appiontments List", (){buttonFunction(3, data);}),


          ],
        );
      }
    );

  }


  Widget button(int id, String buttonName, Function onTap){
    return Center(
      child: GestureDetector(
        onTap: (){
          onTap();
        },
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue,
          ),
          child: Center(child: Text(
            buttonName,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white
            ),
            )),
        ),
      ),
    );

  }

  buttonFunction(int id, StoredDataProvider data ){
     if (id==1){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
            }else if(id==2){
               appointmentProvider!.getAppointmentProvider(
                context, data.userNameController.text, 
                data.passwordController.text, 
                data.dateController.text,
                data.urlController.text
                );
              
             
            }else if(id==3){
              if(appointmentProvider!.appointment!.isNotEmpty){
 Navigator.push(context, MaterialPageRoute(builder:(context)=>ViewAppointmentScreen()));
              }else{
                showErrorNotification(context, "No Appointments Found, Please refresh data");
              }
             
            }

  }
}
