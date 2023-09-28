import 'package:flutter/material.dart';
import 'package:todoapp/helper/DBHelper.dart';
DBHelper db = DBHelper();
class NoteView extends StatelessWidget {
  Map<String,dynamic> note;
  int index;
  var onclick;
  NoteView (this.index,this.note,this.onclick){
    super.key;
    print(note);
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onclick(),
      child: Container(
        height: 300,
        width: 200,
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 7),
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Color.fromRGBO(224, 224, 224, 1.0),blurRadius: 10.0,)],
          image: DecorationImage(image: AssetImage("assets/images/stickynotebg.png"),fit:BoxFit.fitHeight),
        ),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(index.toString(),
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black87
              ),
            ),
            Container(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(note["title"],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  Text(note["description"],
                    softWrap: false,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black54
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
