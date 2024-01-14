import 'package:flutter/material.dart';
import 'package:sqflite1/widgets/UiHelper.dart';

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
            UiHelper.CustomButton(() { }, "Save")
          ],

        ),
      ),

    );
  }
}
