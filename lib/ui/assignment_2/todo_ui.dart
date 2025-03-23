import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/assignment_2/todo_bloc.dart';
import '../../utils/todo_utils.dart';

class TodoUi extends StatefulWidget {
  const TodoUi({super.key});

  @override
  State<TodoUi> createState() => _TodoUiState();
}

class _TodoUiState extends State<TodoUi> {

  @override
  void initState() {
    // TODO: implement initStateHit
    super.initState();
    context.read<TodoBloc>().add(HitTodoApi());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Assignments 2", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          centerTitle: true,
          shadowColor: Colors.redAccent,
          elevation: 5,
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state){
            if(state.todoStatus == TodoEnum.loading){
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.redAccent,
                  color: Colors.white,
                ),
              );
            }
            else if(state.todoStatus == TodoEnum.failed){
              return Text(state.msg);
            }
            else{
              return ListView.builder(
                itemCount: state.todolist.length,
                itemBuilder: (context, index){
                  final item = state.todolist[index];
                  return ListTile(
                    title: Text("Id: ${item.id}"),
                    subtitle: Text("Completed: ${item.completed}"),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
