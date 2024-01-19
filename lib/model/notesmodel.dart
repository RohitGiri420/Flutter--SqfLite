import 'package:sqflite1/database/DbHelper.dart';

class NotedModel {
  int? NoteId;
  String Title;
  String Decs;

  NotedModel({required this.Title, required this.Decs, this.NoteId});

  factory NotedModel.fromMap(Map<String, dynamic> map) {
    return NotedModel(
        Title: map[DbHelper.NoteTitle],
        Decs: map[DbHelper.NoteDesc],
        NoteId: map[DbHelper.NoteId]);
  }

  Map<String, dynamic> toMap() {
    return {
      DbHelper.NoteId: NoteId,
      DbHelper.NoteTitle: Title,
      DbHelper.NoteDesc: Decs
    };
  }
}
