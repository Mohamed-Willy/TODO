import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/Home.dart';
class createnewtask extends StatefulWidget {
  const createnewtask({Key? key}) : super(key: key);

  @override
  _createnewtaskState createState() => _createnewtaskState();
}

class _createnewtaskState extends State<createnewtask> {
  String title = "";
  String day = "";
  String month = "";
  String year = "";
  void validate(){
    if(title == "" || day == "" || month == "" || year == ""){
      showDialog(context: context,builder: (BuildContext context) {return AlertDialog(content: Text("PLEASE ENTER ALL NEEDED DATA!"));});
      return;
    }
    for(int i = 0; i < title.length; i++){
      if(title[i]=='+'){
        showDialog(context: context,builder: (BuildContext context) {return AlertDialog(content: Text("INVALID TITLE REMOVE ANY +SIGN!"));});
        return;
      }
    }
    if(int.parse(day)<0||int.parse(day)>31){
      showDialog(context: context,builder: (BuildContext context) {return AlertDialog(content: Text("INVALID DUE DAY!"));});
    }
    else if(int.parse(month)<0||int.parse(month)>12){
      showDialog(context: context,builder: (BuildContext context) {return AlertDialog(content: Text("INVALID DUE MONTH!"));});
    }
    else if(int.parse(year)<2000){
      showDialog(context: context,builder: (BuildContext context) {return AlertDialog(content: Text("INVALID DUE YEAR!"));});
    }
    else{
      setState(() {
        tasknum++;
        tasktitles += title + "+";
        taskdue += day + "/" + month + "/" + year + "+";
        taskdon += "0+";
        print(taskdue);
      });
      print(tasktitles);
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => Home()
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ADD TASK",
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 5.0,
            color: Colors.red[900],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(child: TextField(
              decoration: InputDecoration(
              hintText: "Enter task title",
            ),
              style: TextStyle(
              fontSize: 50.0,
              fontFamily: 'MyFont',
              color: Colors.white,

            ),
              onChanged: (String s){
              title = s;
              },
          )),
          Expanded(child: TextField(
            onChanged: (String s){
              day = s;
            },
              decoration: InputDecoration(
              hintText: "Enter due day",
            ),
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'MyFont',
              color: Colors.white,
            ),
          )),
          Expanded(child: TextField(
            onChanged: (String s){
              month = s;
            },
            decoration: InputDecoration(
              hintText: "Enter due month",
            ),
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'MyFont',
              color: Colors.white,
            ),
          )),
          Expanded(child: TextField(
            onChanged: (String s){
              year = s;
            },
            decoration: InputDecoration(
              hintText: "Enter due year",
            ),
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'MyFont',
              color: Colors.white,
            ),
          )),
          Expanded(child: FlatButton(
            minWidth: double.infinity,
            color: Colors.blue,
            onPressed: validate,
            child: Text(
              "ADD!",
              style: TextStyle(
                fontSize: 100.0,
                letterSpacing: 20.0,
                color: Colors.red[900],
              ),
            ),
          ))
        ],
      ),
      backgroundColor: Colors.grey[600],

    );
  }
}
