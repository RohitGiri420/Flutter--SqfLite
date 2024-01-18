import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite1/database/DbHelper.dart';
import 'package:sqflite1/model/notesmodel.dart';
import 'package:sqflite1/widgets/UiHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override


  late DbHelper db;
  List<NotedModel> arrlist =[];
  getData () async{
    arrlist = await db.getData();
    setState(() {

    });
  }

  void initState() {
    // TODO: implement initStates
    super.initState();

    db = DbHelper.db;
    getData();
    setState(() {

    });
  }

  AddData(String Title , String desc) async{
    if(Title == ""||desc == ""){
      log("enter Required fields");
    }

    else{
      bool check = await DbHelper().addData(NotedModel(Title: Title, Decs: desc));
      if(check){
       arrlist=await db.getData();
       setState(() {

       });
      }



      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(leading: Text("${arrlist[index].NoteId}") ,title: Text("${arrlist[index].Title}"),subtitle:Text("${arrlist[index].Decs}"),);
      },
        itemCount: arrlist.length,),

      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context, builder:(BuildContext context){
          return Container(
            height: 400,
            width: 400,
            child: Column(
              children: [
                SizedBox(height: 20,),
                UiHelper.CustomTextField(emailController, "Title"),
                SizedBox(height: 20,),
                UiHelper.CustomTextField(passController, "subtitle"),

                SizedBox(height: 20,),
                UiHelper.CustomButton(() { AddData(emailController.text.toString(), passController.text.toString());
                 }, "Insert")
              ],
            ),
          );
        },);
      }),
    );


  }
}
