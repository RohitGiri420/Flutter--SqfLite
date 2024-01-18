import 'package:flutter/material.dart';
import 'package:sqflite1/database/DbHelper.dart';
import 'package:sqflite1/model/notesmodel.dart';
import 'package:sqflite1/widgets/UiHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    db = DbHelper.db;
    getData();
  }

  late DbHelper db;
  List<NotedModel> arrlist =[];
  getData () async{
    arrlist = await db.getData();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(leading: Text("${arrlist[index].NoteId}") ,title: Text("${arrlist[index].Title}"),subtitle:Text("${arrlist[index].Decs}"),);
      },
        itemCount: arrlist.length,),
    );
  }
}
