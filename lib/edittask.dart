import 'package:flutter/material.dart';
import 'package:flutter_projects/Home.dart';
int indx = 0;
class edittask extends StatefulWidget {
  edittask(int ind){
    indx = ind;
  }

  @override
  _edittaskState createState() => _edittaskState();
}

class _edittaskState extends State<edittask> {
  void changedon(){
    print(taskdon);
    int c = 0;
    String s = "";
    for(int j = 0;j < taskdon.length-1;j++){
      if(taskdon[j+1] == '+' && c == indx)
      {
        s+= (1 - int.parse(taskdon[j])).toString();
      }
      else if(taskdon[j] == '+')
      {
        c++;
        s+=taskdon[j];
      }
      else s+=taskdon[j];
    }
    setState(() {
      taskdon = s+"+";
      Navigator.push(context, MaterialPageRoute(
      builder: (context) => Home()
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: Text(
        "Editing..",
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Task(getTask(indx),getDon(indx),getDue(indx),indx,false),
            CheckboxListTile(
              title: Text(
                "Done",
                style: TextStyle(
                  fontSize: 40.0
                ),
              ),
              activeColor: Colors.white,
              controlAffinity: ListTileControlAffinity.trailing,
              value: getDon(indx),
              onChanged: (bool? value) { changedon(); },
            )
          ],
        ),
      ),

    );
  }
}
