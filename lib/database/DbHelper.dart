import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{

  var tableName = "User_Detail";
  var columnId  = "User_Id";
  var columnEmail = "Email";
  var columnPass  = "Password";

  Future<Database> openDb() async{
    var directory = await getApplicationDocumentsDirectory();
    directory.create(recursive: true);
    var path = await directory.path+'userdb.db';

    return openDatabase(path,version: 1,onCreate: (db, version){

      db.execute("CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY AUTOINCRIMENT,$columnEmail TEXT,$columnPass TEXT )");

    },);
  }

  addData(String email,String password) async{

    var db = await openDb();

    db.insert(tableName, {
      columnEmail:email,
      columnPass:password
    });

  }

}