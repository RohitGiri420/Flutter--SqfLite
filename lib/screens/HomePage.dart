import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sqflite1/database/DbHelper.dart';
import 'package:sqflite1/widgets/UiHelper.dart';
import 'dart:developer';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomTextField(emailController, "Email"),
            UiHelper.CustomTextField(passController, "Password"),
            UiHelper.CustomButton(() { adddata(emailController.text.toString(), passController.text.toString()); }, "Save")
          ],

        ),
      ),

    );
  }

  adddata(String email,String password){
    if(email=="" && password == ""){
      return 0;
    }

    else{
      DbHelper().addData(email, password);
    }
  }
}
