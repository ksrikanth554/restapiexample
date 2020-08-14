import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Message'),
      content: Text('Do You Want Delete'),
      actions: <Widget>[
      FlatButton(
        child: Text('Yes'),
        onPressed: (){
          Navigator.pop(context,true);
        }, 
       ),
      FlatButton(
        child: Text('No'),
        onPressed: (){
        Navigator.pop(context,false);
        }, 
       )
      ],
    );
  }
}