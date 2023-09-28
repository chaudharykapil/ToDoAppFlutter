
import 'package:flutter/material.dart';
import 'package:todoapp/helper/DBHelper.dart';
import 'package:todoapp/routes/components/NoteView.dart';
DBHelper db = DBHelper();
class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
  
}
class HomePageState extends State<HomePage>{
  List<Map<String,dynamic>>? allnotes = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllnotes();

  }
  getAllnotes(){
    db.init().then((value){
      db.queryAllNotes().then((value) {
        setState(() {
          allnotes = value;
          print(allnotes);
        });
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    db.close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("ToDoApp"),),
      body: Container(
        child: GridView.count(
          crossAxisCount:2,
          childAspectRatio: 795/500,
          children: List.generate(allnotes!.length, (index){
            return NoteView(index+1, allnotes![index],()=>Navigator.pushNamed(context, "/note",arguments: allnotes![index]).then((value) => getAllnotes()));
          } )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text("New"),
        onPressed: () { Navigator.pushNamed(context, "/new").then((value) => getAllnotes()); },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
