import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{

  var tableName = "UserDetails";
  var columnId = "UserId";
  var columnEmail = "UserEmail";
  var columnPass = "UserPassword";

  Future<Database> openDb()async{

    var directory = await getApplicationDocumentsDirectory();
    await directory.create(recursive: true);
    var path = directory.path+"UserDb.db";

    return openDatabase(path,version: 1,onCreate: (db, version){

      db.execute("Create table $tableName ( $columnId integer primary key autoincrement, $columnEmail text, $columnPass text )");
    },);


  }

  addData(String email,String password) async{
    var db = await openDb();
    db.insert(tableName,{
      columnEmail: email,
      columnPass: password
    });



  }

}