import 'package:flutter_application/user.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class DatabaseHelper{

  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String userTable = 'user_table';
  String colId = 'id';
  String colRate = 'rate';
  String colTemperature = 'temperature';
  String colOxygen = 'oxygen';
  String colDate = 'date';

  DatabaseHelper._createInstance();

  factory DatabaseHelper(){
    if(_databaseHelper==null){
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper!;
  }

  Future<Database> get database async {

		if (_database == null) {
			_database = await initializeDatabase();
		}
		return _database!;
	}

  Future<Database> initializeDatabase() async {
		// Get the directory path for both Android and iOS to store database.
		Directory directory = await getApplicationDocumentsDirectory();
		String path = directory.path + 'users.db';

		// Open/create the database at a given path
		var movieDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
		return movieDatabase;
	}

  void _createDb(Database db,int newVersion)async{

    await db.execute('CREATE TABLE $userTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colRate TEXT, '
				'$colTemperature TEXT, $colOxygen TEXT, $colDate TEXT)');

  }


  // Fetch Operation: Get all note objects from database
	Future<List<Map<String, dynamic>>> getUserMapList() async {
		Database db = await this.database;

//  var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
		 var result = await db.query(userTable, orderBy: '$colDate ASC');
		return result;
	}

  // Insert Operation: Insert a Note object to database
	Future<int> insertMovie(User user) async {
		Database db = await this.database;
		var result = await db.insert(userTable, user.toMap());
		return result;
	}


  // Get number of Note objects in database
	Future<int?> getCount() async {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $userTable');
		int? result = Sqflite.firstIntValue(x);
		return result;
	}

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
	Future<List<User>> getUserList() async {

    // Get 'Map List' from database
		var userMapList = await getUserMapList(); 

    // Count the number of map entries in db table
		int count = userMapList.length;         

		List<User> userList = [];

		// For loop to create a 'Note List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			userList.add(User.fromMapObject(userMapList[i]));
		}
		return userList;
	}

}