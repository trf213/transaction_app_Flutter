import 'package:digital_wallet/Models/TransactionDetails.dart';
import 'package:digital_wallet/Models/UserModal.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:digital_wallet/Models/JournalNotes.dart';

class DBProvider with ChangeNotifier {

	DBProvider._();

  static final DBProvider db = DBProvider._();  // Singleton DatabaseHelper
	static Database _database;                // Singleton Database

  //User Model
  String userTable = 'User_table';
  String userName = 'name';
  String userDob = 'dob';
  String userGender= 'gender';

  // Journal Notes
	String journalTable = 'Journal_table';
	String colId = 'id';
	String colContent = 'content';

  // Transaction Details
  String transactionTable = 'Transaction_table';
	String transId = 'id';
	String transDesc = 'description';
  String transTimeStamp = 'timestamp';
  String transAmount = 'amount';
  String transCategory = 'category';


	

	Future<Database> get database async {

		if (_database == null) {
			_database = await initDB();
		}
		return _database;
	}

	Future<Database> initDB() async {
		// Get the directory path for both Android and iOS to store database.
		Directory directory = await getApplicationDocumentsDirectory();
		String path = directory.path + 'app.db';

		// Open/create the database at a given path
		var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb, );
		return notesDatabase;
	}

	void _createDb(Database db, int newVersion) async {

		await db.execute('CREATE TABLE $journalTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colContent TEXT)'
				);
    await db.execute('CREATE TABLE $transactionTable($transId INTEGER PRIMARY KEY AUTOINCREMENT, $transDesc TEXT, $transTimeStamp TEXT, $transAmount TEXT, $transCategory TEXT)'
				);
    await db.execute('CREATE TABLE $userTable(id INTEGER PRIMARY KEY ,$userName TEXT, $userDob TEXT, $userGender TEXT)'
				);
	}
 /* */
  	// Insert Operation: Insert a Note object to database
	Future<int> insertUser(User user) async {
		Database db = await this.database;
		var result = await db.insert(userTable, user.toMap());
		return result;
	}

	// Update Operation: Update a Note object and save it to database
	Future<int> updateUser(User user) async {
		var db = await this.database;
		var result = await db.update(userTable,user.toMap(), where: 'id = ?', whereArgs: [1]);
		return result;
	}

	// Delete Operation: Delete a Note object from database
	Future<int> deleteUser(String name) async {
		var db = await this.database;
		int result = await db.rawDelete('DELETE FROM $userTable WHERE $userName = $name');
		return result;
	}

  Future<User> getUser() async {
    Database db = await this.database;
		var userMapList = await db.query(userTable,); 
		User user = User();
	
		if(userMapList != null){
			user = User.fromMap(userMapList[0]);
      return user;
    }
    else return null;
  }


	// Fetch Operation: Get all note objects from database
	Future<List<Map<String, dynamic>>> getNoteMapList() async {
		Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
		var result = await db.query(journalTable,);
		return result;
	}

	// Insert Operation: Insert a Note object to database
	Future<int> insertNote(JournalNotes note) async {
		Database db = await this.database;
		var result = await db.insert(journalTable, note.toMap());
		return result;
	}

	// Update Operation: Update a Note object and save it to database
	Future<int> updateNote(JournalNotes note) async {
		var db = await this.database;
		var result = await db.update(journalTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
		return result;
	}

	// Delete Operation: Delete a Note object from database
	Future<int> deleteNote(int id) async {
		var db = await this.database;
		int result = await db.rawDelete('DELETE FROM $journalTable WHERE $colId = $id');
		return result;
	}

	// Get number of Note objects in database
	Future<int> getCount() async {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $journalTable');
		int result = Sqflite.firstIntValue(x);
		return result;
	}

	// Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
	Future<List<JournalNotes>> getNoteList() async {

		var noteMapList = await getNoteMapList(); // Get 'Map List' from database
		int count = noteMapList.length;         // Count the number of map entries in db table

		List<JournalNotes> noteList = List<JournalNotes>();
		// For loop to create a 'Note List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			noteList.add(JournalNotes.fromMap(noteMapList[i]));
		}
   
		return noteList;
	}

  //Transactions 
  	Future<List<Map<String, dynamic>>> getTransactionMapList() async {
		Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
		var result = await db.query(transactionTable,);
		return result;
	}

	// Insert Operation: Insert a Note object to database
	Future<int> insertTransaction(TransactionDetails trans) async {
		Database db = await this.database;
		var result = await db.insert(transactionTable, trans.toMap());
		return result;
	}

	// Update Operation: Update a Note object and save it to database
	Future<int> updateTransaction(TransactionDetails trans) async {
		var db = await this.database;
		var result = await db.update(journalTable, trans.toMap(), where: '$transId = ?', whereArgs: [trans.transId]);
		return result;
	}

	// Delete Operation: Delete a Note object from database
	Future<int> deleteTransaction(int id) async {
		var db = await this.database;
		int result = await db.rawDelete('DELETE FROM $transactionTable WHERE $transId = $id');
		return result;
	}


	

	// Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
	Future<List<TransactionDetails>> getTransactionList() async {

		var noteMapList = await getTransactionMapList(); // Get 'Map List' from database
		int count = noteMapList.length;         // Count the number of map entries in db table

		List<TransactionDetails> transList = List<TransactionDetails>();
		// For loop to create a 'Note List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			transList.add(TransactionDetails.fromMap(noteMapList[i]));
		}
   
		return transList;
	}

}