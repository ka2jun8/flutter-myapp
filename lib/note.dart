import 'package:flutter/material.dart';
import 'package:my_app/create.dart';
import 'package:my_app/detail.dart';
import 'package:my_app/entity/memo.dart';

class Note extends StatefulWidget {
  Note({Key key}) : super(key: key);

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  List<Memo> memos = new List<Memo>();
  final _biggerFont = const TextStyle(
    color: Colors.black,
    fontSize: 18.0,
  );

  void _addNote() {
    Memo newMemo = Memo('','');
    memos.add(newMemo);
    Navigator.push(context, MaterialPageRoute<Null>(
      settings: const RouteSettings(name: "/create"),
      builder: (BuildContext context) => Create(newMemo)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _list(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Note',
        child: Icon(Icons.add),
        onPressed: _addNote,
      ),
    );
  }

  Widget _list() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: memos.length,
      itemBuilder: (context, i) {
        final item = memos[i];

        return Dismissible(
          key: Key(item.title),
          onDismissed: (direction) {
            memos.removeAt(i);

            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Memo dismissed"))
            );
          },
          background: Container(color: Colors.red),
          child: ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text(
              item.title,
              style: _biggerFont,
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute<Null>(
                settings: const RouteSettings(name: "/detail"),
                builder: (BuildContext context) => Detail(item),
              ));
            },
          ),
        );
      },
    );
  }
}
