// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_projects/createtask.dart';
import 'package:flutter_projects/edittask.dart';
class Task extends StatelessWidget {
  Color? done = Colors.red[900];
  String title = "task title";
  String due = "2/7/2001";
  int indx = 0;
  bool clickable = false;
  Task(String titlee, bool don, String date, int x ,bool clickablee, {Key? key}) : super(key: key){
    clickable = clickablee;
    indx = x;
    due = date;
    title = titlee;
   if(don == true) done = Colors.green[500];
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          margin: EdgeInsets.only(
              top: 20.0
          ),
          decoration: BoxDecoration(
            color: done,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontFamily: 'MyFont',
                ),
              ),
              Text(
                due,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontFamily: 'MyFont',
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          if(clickable){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => edittask(indx)
          ));
          }
        },
    );

  }
}
int tasknum = 1;
String taskdue = "hi+",tasktitles = "hi+",taskdon = "hi+", ss = "", ssd = "";
String editask = "",editdate = "";
String getTask(int i){
  int c = 0;
  for(int j = 0;j<tasktitles.length;j++){
    if(tasktitles[j] == '+' && c == i)
    {
      return ss;
    }
    else if(tasktitles[j] == '+')
    {
      c++;
      ss = "";
    }
    else
    {
      ss += tasktitles[j];
    }
  }
  return "";
}
String getDue(int i){
  int c = 0;
  for(int j = 0;j<taskdue.length;j++){
    if(taskdue[j] == '+' && c == i)
    {
      return ssd;
    }
    else if(taskdue[j] == '+')
    {
      c++;
      ssd = "";
    }
    else
    {
      ssd += taskdue[j];
    }
  }
  return "";
}
bool getDon(int i){
  int c = 0;
  for(int j = 0;j<taskdon.length;j++){
    if(taskdon[j] == '+' && c == i)
    {
      return int.parse(taskdon[j-1]) == 1;
    }
    else if(taskdon[j] == '+')
    {
      c++;
    }
  }
  return false;
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void addNew(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => createnewtask()
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "TO DO",
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
      body: SafeArea(
        child: Column(
        children: [
          Expanded(child: ListView(
            children: [
                for(int i = 1;i < tasknum;i++)Task(getTask(i),getDon(i),getDue(i),i,true)
            ],
          ))
        ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: addNew,
        child: Text("+",style: TextStyle(fontSize: 40.0,),),
        backgroundColor: Colors.black,
      ),
    );
  }
}





