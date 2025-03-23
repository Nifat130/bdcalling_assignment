import 'dart:async';

import 'package:bdcalling/model/assignment_3/local_database_model.dart';
import 'package:bdcalling/repository/assignment_3/local_database_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../utils/local_database_utils.dart';

part 'local_database_event.dart';
part 'local_database_state.dart';

class LocalDatabaseBloc extends Bloc<LocalDatabaseEvent, LocalDatabaseState> {
  LocalDatabaseRepository commentRepository = LocalDatabaseRepository();
  LocalDatabaseBloc() : super(LocalDatabaseState()) {
    on<HitCommentApi>(_fetchData);
  }

  FutureOr<void> _fetchData(HitCommentApi event, Emitter<LocalDatabaseState> emit) async{
    try{
      await commentRepository.fetchComment().then((value) async{
        emit(state.copyWith(
            commentstatus: CommentEnum.success,
            commentlist: value
        ));
      }).onError((error, stacktracer){
        emit(state.copyWith(
          commentstatus: CommentEnum.failed,
          msg: "No internet!!!!",
        ));
      });
    }catch(e){
      print("This is me here" + e.toString());
    }
  }
}
