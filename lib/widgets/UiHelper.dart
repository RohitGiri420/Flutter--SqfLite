import 'package:flutter/material.dart';

class UiHelper{

  static CustomTextField(TextEditingController controller, String label)=> Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
    child: TextField(

      controller: controller,
      decoration: InputDecoration(
        label: Text(label),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black26),

        ),
      ),

    ),
  );

  static CustomButton(VoidCallback onpressed,String text)=>ElevatedButton(onPressed: onpressed, child: Text(text));

  static CustomListView(String Index, String title,String subtitle, int count ){
    return ListView.builder(itemBuilder: (context, index) {
      return ListTile(leading: Text(Index) ,title: Text(title),subtitle:Text(subtitle),);
    },
    itemCount: count,);
  }

}