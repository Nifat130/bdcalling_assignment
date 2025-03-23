import 'package:bdcalling/bloc/assignment_2/todo_bloc.dart';
import 'package:bdcalling/model/assignment_3/local_database_model.dart';
import 'package:bdcalling/ui/start/start_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/assignment_3/local_database_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(LocalDatabaseModelAdapter());
  await Hive.openBox<LocalDatabaseModel>("cache");
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context){

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TodoBloc()),
        BlocProvider(create: (_) => LocalDatabaseBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              )
            ),
        ),
        home: StartUi(),
      ),
    );
  }
}