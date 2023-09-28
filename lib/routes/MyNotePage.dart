import 'package:flutter/material.dart';
import 'package:todoapp/Model/NoteModel.dart';
import 'package:todoapp/helper/DBHelper.dart';
DBHelper db = DBHelper();
class MyNotePage extends StatefulWidget{
  const MyNotePage();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyNotePagestate();
  }

}
class MyNotePagestate extends State<MyNotePage> {
  bool isedit = false;
  TextEditingController titlecontroler = TextEditingController();
  TextEditingController Desc_controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.init();

  }
  void on_update(BuildContext context,int id){
    db.updateNote({'title':titlecontroler.text,'description':Desc_controller.text}, id).then((value) => {Navigator.pop(context)});
  }
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Map;
    titlecontroler.value = TextEditingValue(text: args["title"]);
    Desc_controller.value = TextEditingValue(text: args["description"]);
    return Scaffold(
      appBar: AppBar(title: const Text("Note"),
        actions: [
          IconButton(onPressed: (){setState(() {
            isedit = true;
          });}, icon: Icon(Icons.edit)),
          IconButton(onPressed: (){db.delete(args["id"]).then((value) => Navigator.pop(context));}, icon: Icon(Icons.delete))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: !isedit ? [
            Text(args!["title"],
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic
              ),
            ),
            Divider(height: 1,thickness: 1,),
            Text(args!["description"],
              style: TextStyle(

              ),
            )
          ]:
          [
            TextField(
              controller: titlecontroler,
              maxLength: 20,
              decoration: const InputDecoration(
                label: Text("Title"),
              ),
              style: const TextStyle(fontSize: 23,),
            ),
            TextField(
              controller: Desc_controller,
              maxLines: 2,
              maxLength: 60,
              decoration: const InputDecoration(
                label: Text("Description"),
              ),
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(onPressed:()=>on_update(context,args['id']),
                style: ElevatedButton.styleFrom(
                    elevation: 20,
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                ),
                child: const Text("Update",style: TextStyle(fontSize: 20),)
            )
          ],
        ),
      ),
    );
  }
}
