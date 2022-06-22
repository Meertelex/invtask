
import 'package:flutter/material.dart';
import 'package:interviewtask/Models/usermodel.dart';
import 'package:interviewtask/Resources/string_mager.dart';
import 'package:intl/intl.dart';
import '../../Resources/local_storage_helper.dart';

class StoredDataProvider extends ChangeNotifier{

 LocalStorageManger localStorageManger = LocalStorageManger();
 UserModel? userModel;
  bool? isDataExisted;
    final now = DateTime.now();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController dateController = TextEditingController();



 StoredDataProvider(){
  getUserData();
 
 }

 getIntialSettingData(){
   userNameController.text = StringManager.userName;
   passwordController.text = StringManager.password;
   urlController.text = StringManager.url;
   dateController.text = DateFormat("dd/MM/yyyy").format(now);
    notifyListeners();
 }

 getJsonData(){
  Map<String, dynamic> data ={
     "UserName": userNameController.text,
    "Password":  passwordController.text,
    "Url": urlController.text,
    "CurrentDate": dateController.text,
  };
  userModel= UserModel.fromJson(data);

  return userModel;
 }

 setUserData()async{
  await getJsonData();
       await localStorageManger.setUserData(userModel!);
       await getUserData();       
  }

  getUserData()async{
    await localStorageManger.getUserData().then((value){
      if(value != null){
        isDataExisted = true;
        userNameController.text = value.userName!;
        passwordController.text = value.password!;
        urlController.text = value.url!;
        dateController.text = value.currentDate!;
         print("data  present $isDataExisted");
        notifyListeners();

      }else{
        isDataExisted=false;
        print("data not present $isDataExisted");
         if(isDataExisted==false){
         print("data is not available, so its created");
        getIntialSettingData();
        setUserData();
  }
        notifyListeners();
      }

    });
  }

   clearLocalData()async{

       await localStorageManger.clearUserData();
        
  }

 
  Future<void> datePicker(BuildContext context, ) async {
  
    final _pickDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(seconds: 1)),
    );
    if (_pickDate == null) {
      return;
    }
    var initialDate = _pickDate;
    dateController.text = initialDate.toString();
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      final String formatted = formatter.format(_pickDate);
       dateController.text = formatted;
       notifyListeners();
     
    
  }

}