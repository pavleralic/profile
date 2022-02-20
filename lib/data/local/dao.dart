abstract class Dao<T> {
  //queries
  String get createTableQuery;

  //abstract mapping methods
  T fromMap(Map<String, dynamic> data);

  List<T> fromList(List<Map<String, dynamic>> data);

  Map<String, dynamic> toMap(T object);
}
