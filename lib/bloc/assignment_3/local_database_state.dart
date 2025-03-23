part of 'local_database_bloc.dart';

class LocalDatabaseState extends Equatable{

  final CommentEnum commentstatus;
  final List<LocalDatabaseModel> commentlist;
  final String msg;

  const LocalDatabaseState({
    this.commentstatus = CommentEnum.loading,
    this.commentlist = const <LocalDatabaseModel>[],
    this.msg = ''
  });

  LocalDatabaseState copyWith({CommentEnum? commentstatus, List<LocalDatabaseModel>? commentlist, String? msg}){
    return LocalDatabaseState(
        commentstatus: commentstatus ?? this.commentstatus,
        commentlist: commentlist ?? this.commentlist,
        msg: msg ?? this.msg
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [commentstatus,commentlist, msg];
}
