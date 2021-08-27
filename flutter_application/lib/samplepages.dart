import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class Page1 extends StatefulWidget {

    // final List<User>? userList;
    // Page1(this.userList);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  //    List<User>? userList;
  // _Page1State(this.userList);

  
  var color;
  var text;
  var rate;
    var data = [70.0,74.0,72.0,90.0,90.0,110.0,95.0,121.0];

@override
  void initState() {


    int n = data.length-1;
    rate = data[n];
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

  //  List<User>? userList;
  // Page2(this.userList);
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  //    List<User>? userList;
  // _Page2State(this.userList);

  var data = [98.7,100.0,98.6,102.2,99.0,104.0,100.0,102.0];
  var color;
  var text;
  var rate;

  @override
  void initState() {
    int n = data.length-1;
    rate = data[n];
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
                        child: Text('$rate F',style: TextStyle(color: color,fontWeight: FontWeight.bold,fontSize: 20)),
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

  //  List<User>? userList;
  // Page3(this.userList);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {

  //  List<User>? userList;
  // _Page3State(this.userList);

  var data = [90.0,96.0,92.0,93.0,92.0,97.0,90.0,98.0];
  var color;
  var text;
  var rate;

@override
  void initState() {
    int n = data.length-1;
    rate = data[n];
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