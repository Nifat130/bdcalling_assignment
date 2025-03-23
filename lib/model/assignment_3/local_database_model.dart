import 'package:hive/hive.dart';
// This will generate the Hive adapter
part 'local_database_model.g.dart';
@HiveType(typeId: 1) // Unique identifier for this type
class LocalDatabaseModel extends HiveObject{
  @HiveField(0) // Field 0
  int? postId;

  @HiveField(1) // Field 1
  int? id;

  @HiveField(2) // Field 2
  String? name;

  @HiveField(3) // Field 3
  String? email;

  @HiveField(4) // Field 4
  String? body;

  LocalDatabaseModel({this.postId, this.id, this.name, this.email, this.body});

  LocalDatabaseModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['body'] = this.body;
    return data;
  }
}
