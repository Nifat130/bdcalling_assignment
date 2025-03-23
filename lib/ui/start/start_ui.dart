import 'package:bdcalling/ui/assignment_1/home_ui.dart';
import 'package:bdcalling/ui/assignment_2/todo_ui.dart';
import 'package:bdcalling/ui/assignment_3/local_database.dart';
import 'package:flutter/material.dart';

class StartUi extends StatelessWidget {
  const StartUi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Assignments", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          centerTitle: true,
          shadowColor: Colors.redAccent,
          elevation: 5,
        ),
        body: Center(
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton("Assignment 1", context, HomeUi()),
              _buildButton("Assignment 2", context, TodoUi()),
              _buildButton("Assignment 3", context, LocalDatabase()),
            ],
          ),
        )
      ),
    );
  }

  Widget _buildButton(String name, BuildContext context, Widget activity){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(name, style: TextStyle(fontSize: 20,),),
      ),
      onPressed: (){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(name))
        );
        Navigator.push(context, MaterialPageRoute(builder: (_) => activity));
      },
    );
  }
}
