import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/routes/components/NoteView.dart';

class HomePage extends StatelessWidget{

  HomePage();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("ToDoApp"),),
      body: Container(
        child: GridView.count(
          crossAxisCount:2,
          childAspectRatio: 795/500,
          children: List.generate(5, (index) => NoteView(index+1,"Running at 5A.M.","assxjnkdmnjckwm dcwnjsck mcsdc")),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text("New"),
        onPressed: () { Navigator.pushNamed(context, "/new"); },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}