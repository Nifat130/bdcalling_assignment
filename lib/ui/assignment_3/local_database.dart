import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../bloc/assignment_3/local_database_bloc.dart';
import '../../model/assignment_3/local_database_model.dart';
import '../../utils/local_database_utils.dart';

class LocalDatabase extends StatefulWidget {
  const LocalDatabase({super.key});

  @override
  State<LocalDatabase> createState() => _LocalDatabaseState();
}

class _LocalDatabaseState extends State<LocalDatabase> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<LocalDatabaseBloc>().add(HitCommentApi());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Comment List"),
          centerTitle: true,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: BlocBuilder<LocalDatabaseBloc, LocalDatabaseState>(
          builder: (context, state){
            if(state.commentstatus == CommentEnum.loading){
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.redAccent,
                  color: Colors.white,
                ),
              );
            }
            else if(state.commentstatus == CommentEnum.failed){
              print("I am here in failed");
              return Column(
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: Text(state.msg, textAlign: TextAlign.center,style: TextStyle(color: Colors.redAccent, fontSize: 20),)
                  ),
                ],
              );
            }
            else{
              return ListView.builder(
                itemCount: state.commentlist.length,
                itemBuilder: (context, index){
                  final item = state.commentlist[index];
                  return ListTile(
                    title: Text("PostId: " + item.postId.toString()),
                    subtitle: Text("Body: " + item.body.toString()),
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

