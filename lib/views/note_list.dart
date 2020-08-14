import 'package:flutter/material.dart';
import 'package:restapiexample/model/note_list_model.dart';
import 'package:restapiexample/views/note_delete.dart';
import 'package:restapiexample/views/note_modify.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final notes=[
    NoteListModel(
      noteId: '1',
      notename: 'note1',
      createdDate: DateTime.now(),
      latestEditDate: DateTime.now(),
    ),
    NoteListModel(
      noteId: '2',
      notename: 'note2',
      createdDate: DateTime.now(),
      latestEditDate: DateTime.now(),
    ),
    NoteListModel(
      noteId: '3',
      notename: 'note3',
      createdDate: DateTime.now(),
      latestEditDate: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of Notes'),
      ),
      body: ListView.separated(
        itemCount: notes.length,
        separatorBuilder: (_,__)=>Divider(height: 1,color: Colors.green,), 
        itemBuilder: (context,index){
          return Dismissible(
              key: ValueKey(notes[index]),
              direction: DismissDirection.startToEnd,
              //onDismissed: (direction){},
              confirmDismiss: (direction)async{
               final result =await showDialog(
                  context:context,
                  builder: (ctx)=>NoteDelete()
                );
               return result;
              },
              background: Container(
                color: Colors.red,
                child: Align(child: Icon(Icons.delete),alignment: Alignment.centerLeft),
              ),
              child: ListTile(
              title: Text('${notes[index].notename}'),
              subtitle: Text('Last Edited Date:${formatDateTime(notes[index].latestEditDate)}'),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                   builder:(ctx)=>NoteModify(nodeId:notes[index].noteId ,)
                  )
                );
              },
            ),
          );
         }, 
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>NoteModify()));
        }
      ),
    );
  }
  String formatDateTime(DateTime dateTime){
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}