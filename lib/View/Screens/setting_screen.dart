import 'package:flutter/material.dart';
import 'package:interviewtask/View/Screens/widgets/alert_dialogues.dart';
import 'package:interviewtask/View/Screens/widgets/toast_services.dart';
import 'package:interviewtask/ViewModel/ProviderService/stored_data_provider.dart';
import 'package:provider/provider.dart';



class SettingScreen extends StatefulWidget {
  const SettingScreen({ Key? key }) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
 StoredDataProvider? storedDataProvider;
 final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    storedDataProvider= Provider.of<StoredDataProvider>(context, listen: false);
    storedDataProvider!.getUserData();
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              onChanged: (){
                _formKey.currentState!.save();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
                  _inputField(1),
                  _inputField(2),
                  _inputField(3),
                  _inputField(4),
                   SizedBox(
                    height: 15,
                  ),
                  button(1, "Update")
                  
                ],
              ),
            ),
          ),
        ),
      ),
      
    );
  }

   AppBar _appBar(){
    return AppBar(
      elevation: 0.0,
      title: Text("Settings"),
    );
  }


  Widget _inputField(int id,){
    return Consumer<StoredDataProvider>(
      builder: (context, data, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            onTap: (){
              if (id==4){
                data.datePicker(context);
              }
            },
            
            readOnly: id==4?true:false,
            keyboardType: TextInputType.multiline,
             minLines: id==3?3:1,
             maxLines: 20,
            maxLength:id==3? 1000:30,
            // maxLength: id==4?0:30,
            controller:myController(id, data),
            decoration: InputDecoration(
              counterText: "",
              labelText: leabelText(id),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4)
              ) 
            ),
            validator: (input){
              if(input!.isEmpty){
                return "Required field is not empty";
              }
            },
          ),
        );
      }
    );
  }



    Widget button(int id, String buttonName){
    return Center(
      child: GestureDetector(
        onTap: (){
          if(_formKey.currentState!.validate()){
            Dialogs.showAlertDialogue(
            context,
             "Do you want to update setting data?", 
            "Yes", 
            (){
            storedDataProvider!.setUserData();
            Navigator.pop(context);
            showSuccessNotification(context, "", "Setting data updated successfully");
            },
            );

          }
          
         // ;
           
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

  String leabelText(int id){
    if (id==1){
      return "User Name";
    }else if(id==2){
      return "Password";
    }else if(id==3){
      return "Url";
    }else if(id==4){
      return "Current Date";
    }
    return "";
    

  }

  TextEditingController? myController(int id,StoredDataProvider data){
    if(id ==1){
      return data.userNameController;
    }else if(id==2){
      return data.passwordController;
    }else if(id==3){
      return data.urlController;
    }else if(id==4){
      return data.dateController;
    }else{
      return null;
    }

  }


 
}