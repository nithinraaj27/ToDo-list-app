import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: deprecated_member_use
  List todos = List();
  String input = "";
  @override
  // void initState() {
  //   super.initState();
  //   todos.add("Item1");
  //   todos.add("Item2");
  //   todos.add("Item3");
  //   todos.add("Item4");
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFC5C5),
      appBar: AppBar(
        backgroundColor: Color(0xffF05151),
        elevation: 0.0,
        title: Text("My ToDo",
        style: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (BuildContext context)
              {
                return AlertDialog(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  title: Text("Add To Do List"),
                  content: TextField(
                    onChanged: (String value){
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    FlatButton(
                        onPressed: (){
                          setState(() {
                            todos.add(input);
                          });
                          Navigator.of(context).pop();
                          },
                        child: Text("Add "))
                  ],
                );
              }
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        )
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context,int index){
              return Dismissible(
                key: Key(todos[index]),
                child: Card(
                  elevation:  4,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: ListTile(
                  title: Text(todos[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,
                      color: Colors.red),
                      onPressed: (){
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                    ),
                ),
              ),);
            }),
      ),
    );
  }
}

