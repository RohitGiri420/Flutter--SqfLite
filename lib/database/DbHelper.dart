import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite1/model/notesmodel.dart';

class DbHelper {
  static final DbHelper db = DbHelper();

  Database? _database;

  static String TableName = "NoteTable";
  static String NoteId = "Note_Id";
  static String NoteTitle = "Note_Title";
  static String NoteDesc = "Note_Description";

  Future<Database> getDb() async {
    if (_database != null) {
      return _database!;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path + "notesDb.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) => db.execute(
          " create table $TableName($NoteId integer primary key autoincrement,$NoteTitle integer,$NoteDesc integer)"
      ),
    );
  }


  Future<bool> addData(NotedModel notedModel) async{

    var db = await getDb();
    int count =await db.insert(TableName, notedModel.toMap());
    return count>0;
  }   

  Future<List<NotedModel>> getData() async{

    var db = await getDb();
    List<NotedModel> ListNotes =[];

    var data = await db.query(TableName);
    for(Map<String,dynamic> eachdata in data){
      NotedModel Newdata = NotedModel.fromMap(eachdata);
      ListNotes.add(Newdata);
    }
    return ListNotes;
  }

}
