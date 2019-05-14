import 'package:flutter/material.dart';
import 'package:my_app/create.dart';
import 'package:my_app/detail.dart';
import 'package:my_app/entity/memo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: 'Note List'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Memo> memos = new List<Memo>();
  final _biggerFont = const TextStyle(
    color: Colors.black,
    fontSize: 18.0,
  );

  // void _addNote() {
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _list(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Note',
        child: Icon(Icons.add),
        onPressed: () {
          Memo newMemo = Memo('','');
          memos.add(newMemo);
          Navigator.push(context, MaterialPageRoute<Null>(
            settings: const RouteSettings(name: "/create"),
            builder: (BuildContext context) => Create(newMemo)
          ));
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
