import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/assignment_2/todo_model.dart';
import '../../repository/assignment_2/todo_repository.dart';
import '../../utils/todo_utils.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoRepository todoRepository = TodoRepository();
  TodoBloc() : super(TodoState()) {
    on<HitTodoApi>(_fetchtodoData);
  }

  FutureOr<void> _fetchtodoData(HitTodoApi event, Emitter<TodoState> emit) async{
    print("I am here in blov");
    try{
      var list = await todoRepository.fetchtodo().then((value){
        emit(
            state.copyWith(
              todoStatus: TodoEnum.success,
              todolist: value,
            )
        );
      }).onError((error, stacktrace){
        emit(
            state.copyWith(
                todoStatus: TodoEnum.failed,
                todolist: [],
                msg: "Something went wrong"
            )
        );
      });
    }catch(e){
      print("Something went wrong in the bloc" + e.toString());
    }
  }
}
