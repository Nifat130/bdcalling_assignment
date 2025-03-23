part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HitTodoApi extends TodoEvent{}