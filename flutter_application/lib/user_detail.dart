
import 'package:flutter/material.dart';
import 'package:flutter_application/user.dart';
import 'package:intl/intl.dart';

import 'database_helper.dart';

class UserDetail extends StatefulWidget {

  final User user;
  UserDetail(this.user);

  @override
  _UserDetailState createState() => _UserDetailState(this.user);
}

class _UserDetailState extends State<UserDetail> {

     User user;
  _UserDetailState(this.user);

  DatabaseHelper databaseHelper= DatabaseHelper();


  TextEditingController rateController = TextEditingController();
  TextEditingController temperatureController = TextEditingController();
  TextEditingController oxygenController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
                 Padding(
                  padding: EdgeInsets.only(top: 15,bottom: 15),
                  child: TextField(
                    controller: rateController,
                    onChanged: (value){
                        updateRate();
                    },
                    decoration: InputDecoration(
                      labelText: "heart rate",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                  ),
                  ),
                     Padding(
                  padding: EdgeInsets.only(top: 15,bottom: 15),
                  child: TextField(
                    controller: temperatureController,
                    onChanged: (value){
                        updateTemperature();
                    },
                    decoration: InputDecoration(
                      labelText: "temperature",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                  ),
                  ),
                     Padding(
                  padding: EdgeInsets.only(top: 15,bottom: 15),
                  child: TextField(
                    controller: oxygenController,
                    onChanged: (value){
                        updateOxygen();
                    },
                    decoration: InputDecoration(
                      labelText: "oxygen",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                  ),
                  ),
        
                     ElevatedButton(
                            onPressed: (){
                              setState(() {
                                _save();
                                print('saved');
                              });                           
                            },
                             child: Text("save"),
                             ),
                        
            ],
          ),
        ),
      ),
    );
  }
   void moveToLastScreen() {
		Navigator.pop(context,true);
   
  }

    void updateRate(){
    user.rate =  rateController.text;
  }

  void updateTemperature(){
    user.temperature = temperatureController.text;
  }

    void updateOxygen(){
    user.oxygen = oxygenController.text;
  }

  //function save data to the database
  void _save()async{

    moveToLastScreen();
      user.date = DateFormat.yMMMd().format(DateTime.now());

       int result = await databaseHelper.insertMovie(user);
      
      if (result != 0) {  // Success
			_showAlertDialog('Status', 'data Saved Successfully');
		} else {  // Failure
			_showAlertDialog('Status', 'Problem Saving data');
		}
  }

    //function show a dialog after saving item
  void _showAlertDialog(String title, String message) {

		AlertDialog alertDialog = AlertDialog(
			title: Text(title),
			content: Text(message),
		);
		showDialog(
				context: context,
				builder: (_) => alertDialog
		);
	}
}