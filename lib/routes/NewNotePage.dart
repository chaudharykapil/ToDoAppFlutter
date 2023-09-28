import 'package:flutter/material.dart';
import 'package:todoapp/Model/NoteModel.dart';
import 'package:todoapp/helper/DBHelper.dart';
DBHelper db = DBHelper();
class NewNotePage extends StatefulWidget{
  @override
  State<NewNotePage> createState() {
    return NewNotePageState();
  }}
class NewNotePageState extends State<NewNotePage>{
  final Title_controller = TextEditingController();
  final Desc_controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.init();
    // Title_controller.addListener(() {
    //   print("Title: "+Title_controller.text);
    // });
    // Desc_controller.addListener(() {
    //   print("Desc: "+Desc_controller.text);
    // });
  }
  void onsubmit(BuildContext context){
    String title = Title_controller.text;
    String description = Desc_controller.text;
    Note newnote = Note(title, description);
    db.insertNote(newnote.toMap()).then((value){
      Navigator.pop(context);
    }
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    Title_controller.dispose();
    Desc_controller.dispose();
    db.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("Add New notes"),
      ),
      body: Container(
          color: const Color.fromRGBO(255, 251, 242, 1.0),
          child:  Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                child: TextField(
                  controller: Title_controller,
                  maxLength: 20,
                  decoration: const InputDecoration(
                    label: Text("Title"),
                  ),
                  style: const TextStyle(fontSize: 23,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                child: TextField(
                  controller: Desc_controller,
                  maxLines: 2,
                  maxLength: 60,
                  decoration: const InputDecoration(
                    label: Text("Description"),
                  ),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed:(){onsubmit(context);},
                        style: ElevatedButton.styleFrom(
                          elevation: 20,
                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                        ),
                        child: const Text("Save",style: TextStyle(fontSize: 25),)
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}