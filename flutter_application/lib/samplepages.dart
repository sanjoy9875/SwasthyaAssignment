import 'package:flutter/material.dart';
import 'package:flutter_application/user.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:sqflite/sqlite_api.dart';

import 'database_helper.dart';

class Page1 extends StatefulWidget {

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  var color = Colors.white;
  var text = "";
  var rate = 0.0;
    List<double> data = [0.0];
        late User user;
        int count = 0;
 
  DatabaseHelper databaseHelper = DatabaseHelper();
    List<User>? userList;

@override
  void initState() {

	final Future<Database> dbFuture = databaseHelper.initializeDatabase();
		dbFuture.then((database) {

			Future<List<User>> userListFuture = databaseHelper.getUserList();
			userListFuture.then((userList) {
				setState(() {
				  this.userList = userList;
				  this.count = userList.length;
          for(int i=0; i<userList.length; i++){
          
          String? s = userList[i].rate;
          double d = double.parse(s!);
           print("data1 : $d");
          data.add(d);

          print("data2 : $data");

        }

         print("data3 : ${data.length}");
          int n = data.length-1;
          rate = data[n];
           print("data4 : $rate");
     if(data[n]>120){
       color = Colors.red;
       text = 'High';
   }
   else if(data[n]>=95 && data[n]<=120){
     color = Colors.yellow;
     text = 'Low';
   }
    else if(data[n]>=70 && data[n]<95){
     color = Colors.green;
     text = 'Normal';
   }
				});
			});
		});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

       if(userList==null){ 
        userList = [];    
      }
      
    print("two de ${data.length}");
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Card(
              
                child:Container(
                  height:130,
                  width: 130,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('$text',style: TextStyle(color: color,fontWeight: FontWeight.bold,fontSize: 14),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('$rate BPM',style: TextStyle(color: color,fontWeight: FontWeight.bold,fontSize: 20)),
                      ),
                    ],
                  ),          
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)
                ),
                color: Colors.white,
                elevation: 10,               
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Heart Rate',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                elevation: 10,
                color: Colors.blue[50],
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Sparkline(
                            data: data,                       
                            lineColor: Colors.blue[400],
                            pointsMode: PointsMode.all,
                            pointSize: 8.0,
                            pointColor: Colors.yellow,
                            ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)
                ),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  var color = Colors.white;
  var text = "";
  var temperature = 0.0;
    List<double> data = [0.0];
        late User user;
        int count = 0;
 
  DatabaseHelper databaseHelper = DatabaseHelper();
    List<User>? userList;


@override
  void initState() {

	final Future<Database> dbFuture = databaseHelper.initializeDatabase();
		dbFuture.then((database) {

			Future<List<User>> userListFuture = databaseHelper.getUserList();
			userListFuture.then((userList) {
				setState(() {
				  this.userList = userList;
				  this.count = userList.length;
          for(int i=0; i<userList.length; i++){
          
          String? s = userList[i].temperature;
          double d = double.parse(s!);
           print("data1 : $d");
          data.add(d);

          print("data2 : $data");

        }

   int n = data.length-1;
    temperature = data[n];
     if(data[n]>103){
       color = Colors.red;
       text = 'High';
   }
   else if(data[n]>=100 && data[n]<=103){
     color = Colors.yellow;
     text = 'Low';
   }
    else if(data[n]>=98.6 && data[n]<100){
     color = Colors.green;
     text = 'Normal';
   }
				});
			});
		});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

      if(userList==null){ 
        userList = [];    
      }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Card(
              
                child:Container(
                  height:130,
                  width: 130,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('$text',style: TextStyle(color: color,fontWeight: FontWeight.bold,fontSize: 14),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('$temperature F',style: TextStyle(color: color,fontWeight: FontWeight.bold,fontSize: 20)),
                      ),
                    ],
                  ),          
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)
                ),
                color: Colors.white,
                elevation: 10,               
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Temperature',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                elevation: 10,
                color: Colors.blue[50],
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Sparkline(
                            data: data,
                            lineColor: Colors.blue[400],
                            pointsMode: PointsMode.all,
                            pointSize: 8.0,
                            pointColor: Colors.yellow,
                            ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)
                ),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatefulWidget {

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {

  var color = Colors.white;
  var text = "";
  var oxygen = 0.0;
    List<double> data = [0.0];
        late User user;
        int count = 0;
 
  DatabaseHelper databaseHelper = DatabaseHelper();
    List<User>? userList;


@override
  void initState() {

	final Future<Database> dbFuture = databaseHelper.initializeDatabase();
		dbFuture.then((database) {

			Future<List<User>> userListFuture = databaseHelper.getUserList();
			userListFuture.then((userList) {
				setState(() {
				  this.userList = userList;
				  this.count = userList.length;
          for(int i=0; i<userList.length; i++){
          
          String? s = userList[i].oxygen;
          double d = double.parse(s!);
           print("data1 : $d");
          data.add(d);

          print("data2 : $data");

        }

     int n = data.length-1;
    oxygen = data[n];
     if(data[n]<90){
       color = Colors.red;
       text = 'High';
   }
   else if(data[n]>=90 && data[n]<=95){
     color = Colors.yellow;
     text = 'Low';
   }
    else if(data[n]>95){
     color = Colors.green;
     text = 'Normal';
   }
				});
			});
		});

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Card(
              
                child:Container(
                  height:130,
                  width: 130,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('$text',style: TextStyle(color: color,fontWeight: FontWeight.bold,fontSize: 14),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('$oxygen F',style: TextStyle(color: color,fontWeight: FontWeight.bold,fontSize: 20)),
                      ),
                    ],
                  ),          
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)
                ),
                color: Colors.white,
                elevation: 10,               
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('SPO2',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                elevation: 10,
                color: Colors.blue[50],
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Sparkline(
                            data: data,
                            lineColor: Colors.blue[400],
                            pointsMode: PointsMode.all,
                            pointSize: 8.0,
                            pointColor: Colors.yellow,
                            ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)
                ),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}