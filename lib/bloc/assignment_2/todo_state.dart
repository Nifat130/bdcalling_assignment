part of 'todo_bloc.dart';

class TodoState extends Equatable{
  final TodoEnum todoStatus;
  final List<TodoModel> todolist;
  final String msg;

  const TodoState({
    this.todoStatus = TodoEnum.loading,
    this.todolist = const <TodoModel>[],
    this.msg = ''
  });

  TodoState copyWith({
    TodoEnum? todoStatus,
    List<TodoModel>? todolist,
    String? msg
  }){
    return TodoState(
        todolist: todolist ?? this.todolist,
        todoStatus: todoStatus ?? this.todoStatus,
        msg: msg ?? this.msg
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [];
}