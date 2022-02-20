import 'package:athlon_task/data/model/profile.dart';

import 'dao.dart';

class ProfileDao implements Dao<Profile> {
  final tableName = 'notes';
  final _columnId = 'id';
  final _columnContent = 'content';
  final _columnCreatedDate = 'created';
  final _columnModifiedDate = 'modified';

  @override
  String get createTableQuery =>
      "CREATE TABLE $tableName($_columnId INTEGER PRIMARY KEY,"
      " $_columnContent TEXT,"
      " $_columnCreatedDate INTEGER,"
      " $_columnModifiedDate INTEGER)";

  @override
  List<Profile> fromList(List<Map<String, dynamic>> data) {
    // TODO: implement fromList
    throw UnimplementedError();
  }

  @override
  Profile fromMap(Map<String, dynamic> data) {
    // TODO: implement fromMap
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap(Profile object) {
    // TODO: implement toMap
    throw UnimplementedError();
  }

// @override
// Note fromMap(Map<String, dynamic> data) {
//   return Note(
//     id: data[_columnId],
//     content: data[_columnContent],
//     created: data[_columnCreatedDate],
//     modified: data[_columnModifiedDate],
//   );
// }
//
// @override
// Map<String, dynamic> toMap(Note object) {
//   return <String, dynamic>{
//     _columnId: object.id,
//     _columnContent: object.content,
//     _columnCreatedDate: object.created,
//     _columnModifiedDate: object.modified
//   };
// }
//
// @override
// List<Note> fromList(List<Map<String, dynamic>> query) {
//   return query.map((e) => fromMap(e)).toList();
// }
}
