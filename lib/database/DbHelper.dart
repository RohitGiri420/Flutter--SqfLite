import 'package:sqflite/sqflite.dart';

class DbHelper{

  
  static final DbHelper db = DbHelper();
  Database? _database;

  static const TableNAme = "UserDetails";
  static const UserId = "UserId";
  static const UserEmail = "UserEmail";
  static const UserPassword = "UserPassword";


}