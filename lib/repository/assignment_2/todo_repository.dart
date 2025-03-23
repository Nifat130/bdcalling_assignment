
import 'dart:convert';

import 'package:http/http.dart' as nifat;
import '../../model/assignment_2/todo_model.dart';
class TodoRepository{


  Future<List<TodoModel>> fetchtodo() async{

    try{
      final response = await nifat.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

      if(response.statusCode == 200){
        final data = jsonDecode(response.body) as List;
        return data.map((e){
          return TodoModel(
              userId: e['userId'],
              id: e['id'],
              title: e['title'],
              completed: e['completed']
          );
        }).toList();
      }
      else{
        return [];
      }
    }catch(e){
      print("Something went wrong in Repository: " + e.toString());
      return [];
    }
  }
}