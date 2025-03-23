import 'dart:convert';
import 'dart:io';

import 'package:bdcalling/model/assignment_3/local_database_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class LocalDatabaseRepository{

  Future<List<LocalDatabaseModel>> fetchComment() async{
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      try{
        final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
        if(response.statusCode == 200){
          final data = jsonDecode(response.body) as List;
          print("I am providing result");
          return data.map((e){
            final s = LocalDatabaseModel(
              id: e['id'],
              body: e['body']
            );
            final box = Hive.box<LocalDatabaseModel>('cache');
            box.add(s);
            s.save();
            return LocalDatabaseModel(
                postId: e['postId'],
                id: e['id'],
                name: e['name'],
                email: e['email'],
                body: e['body']
            );
          }).toList();
        }
        else{
          return [];
        }
      }catch(e){
        return [];
      } // Internet is available
    }
    else{
      return [];
    }
  }

}