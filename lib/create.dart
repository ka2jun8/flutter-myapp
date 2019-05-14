import 'package:flutter/material.dart';
import 'package:my_app/entity/memo.dart';

class Create extends StatelessWidget {
  final Memo _memo;
  Create(this._memo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new note'),
      ),
      body: ListView(children: <Widget>[
        Text("Create Memo"),
        TextField(
          decoration: InputDecoration(
            hintText: "Write title."
          ),
          controller: TextEditingController(text: _memo.title),
          onChanged: (String newTitle) {
            _memo.title = newTitle;
          },
        ),
        TextField(
          maxLines: 10,
          decoration: InputDecoration(
            hintText: "Write memo."
          ),
          controller: TextEditingController(text: _memo.body),
          onChanged: (String newBody) {
            _memo.body = newBody;
          },
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            height: 75.0,
            width: 150.0,

            child: FlatButton(
              child: Text('save memo'),
              color: Colors.lightBlue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ])
    );
  }

}