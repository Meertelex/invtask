
import 'package:flutter/material.dart';

enum alertDialogAction { cancel, save }

class Dialogs {
  static Object showAlertDialogue(
    BuildContext context,
    String title,
    String submit,
    Function onpressed,
  ) {
    Future action = showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
           // title:Text(title, style: TextStyle(fontSize: 15),),
            content: Text(title,),
            actions: <Widget>[
              FlatButton(
                  onPressed: () =>
                      Navigator.pop(context, alertDialogAction.cancel),
                  child: Text("No")),
              FlatButton(
              
                  onPressed: () {
                    onpressed();
                  },
                     
                  child: Text(
                    submit,
                   
                  )),
            ],
          );
        });
    return (action != null) ? action : alertDialogAction.cancel;
  }



  static Object loadingDialogue({
    BuildContext? context,
    String? subHeading,
  }) {
    Future action = showDialog(
        context: context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Row(
              children: [
                const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    subHeading!,
  
                  ),
                )
              ],
            ),
          );
        });
    // ignore: unnecessary_null_comparison
    if ((action != null)) {
      return action;
    } else {
      return alertDialogAction.cancel;
    }
  }
}