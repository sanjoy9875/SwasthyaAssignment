import 'package:flutter/material.dart';
import 'package:flutter_application/samplepages.dart';
import 'package:flutter_application/user.dart';
import 'package:flutter_application/user_detail.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

    late User user;
 
  DatabaseHelper databaseHelper = DatabaseHelper();
    List<User>? userList;
    int count = 0;
   var _pagesData = [Page1(),Page2(),Page3()];
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {

          if(userList==null){ 
        userList = [];    
        updateListView();

      }

    return Scaffold(
          floatingActionButton: FloatingActionButton(
        onPressed: (){
           navigateToUserDetail(User('', '', '',null));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Vitals Summary'),
      ),
      body: Center(
        child: _pagesData[_selectedItem],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/heart.svg',height: 20,width: 20,),label: 'Heart Rate'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/temperature.svg',height: 20,width: 20,),label: 'Temperature'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/oxygen.svg',height: 20,width: 20,),label: 'SPO2')
        ],
        currentIndex: _selectedItem,
        onTap: (setValue){
          setState(() {
            _selectedItem = setValue;
          });
        },
      ),
    );
  }

//update the listView when new item will add or delete
  void updateListView() {

		final Future<Database> dbFuture = databaseHelper.initializeDatabase();
		dbFuture.then((database) {

			Future<List<User>> userListFuture = databaseHelper.getUserList();
			userListFuture.then((userList) {
				setState(() {
				  this.userList = userList;
				  this.count = userList.length;
				});
			});
		});
  }

    void navigateToUserDetail(User user)async{
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context){
        return UserDetail(user);
    }),);
    if(result == true){
      updateListView();
        
    }
  }

}