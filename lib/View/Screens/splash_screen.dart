import 'package:flutter/material.dart';
import 'package:interviewtask/Models/usermodel.dart';
import 'package:interviewtask/NetworkService/Services/api_service.dart';
import 'package:interviewtask/Resources/local_storage_helper.dart';
import 'package:interviewtask/View/Screens/home_screen.dart';
import 'package:interviewtask/ViewModel/ProviderService/appointment_provider.dart';
import 'package:provider/provider.dart';

import '../../Resources/string_mager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppointmentProvider? appointmentProvider;
   LocalStorageManger localStorageManger = LocalStorageManger();
   bool? isDateExisted;

  @override
  void initState() {
  
  //  callLocalData();
//ApiService().getAppointmentApi();

    // TODO: implement initState
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(child: _titleWidget()),
    );
  }

  Widget _titleWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringManager.splashName,
          style: const TextStyle(fontSize: 25, color: Colors.white),
        ),
        const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ],
    );
  }


 Future setUserData()async{
      LocalStorageManger localStorageManger = LocalStorageManger();
       var meer=   await localStorageManger.setUserData(
            UserModel(userName: StringManager.userName, 
          password: StringManager.password,
          url: StringManager.url,
          currentDate: "",
          )
          );
          print(meer);
  }


  Future<bool?> getStoredData() async {
    await localStorageManger.getUserData().then((value) {
      print("meer $value");
      if (value != null) {
        setState(() {
          isDateExisted = true;
        });
      

        return true;
      } else {
        setState(() {
          isDateExisted = false;
        });
      
        return false;
      }
    });
    return null;
  }


 Future callLocalData()async{
    if (isDateExisted==true){
     await getStoredData();
    }else{
    await  setUserData();
    }
  }

}
