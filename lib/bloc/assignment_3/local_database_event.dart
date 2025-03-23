part of 'local_database_bloc.dart';

abstract class LocalDatabaseEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HitCommentApi extends LocalDatabaseEvent{}
