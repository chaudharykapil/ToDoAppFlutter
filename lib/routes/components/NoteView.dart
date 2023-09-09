import 'package:flutter/material.dart';

class NoteView extends StatelessWidget {
  String title;
  String description;
  int id;
  NoteView (this.id,this.title,this.description){
        super.key;
      }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(id.toString(),
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
                Text(title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Text(description,
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
    );
  }
}
