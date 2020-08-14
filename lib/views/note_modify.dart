import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  final String nodeId;
  NoteModify({this.nodeId});
  bool get isEditing=>nodeId!=null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isEditing?Text('Edit Note'):Text('Create Note'),
      ),
      body: Padding(padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            TextField(
             decoration: InputDecoration(
               hintText: 'Note Name'
               
             ),
            ),
            TextField(
             decoration: InputDecoration(
               hintText: 'Note content'
               
             ),
             
            ),
            Container(
              
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                child: Text('Submit',style: TextStyle(color: Colors.white),),
                onPressed: (){
                  if(isEditing){
                    //note editing
                  }
                  else{
                    //new note
                  }
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}