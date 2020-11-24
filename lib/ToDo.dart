import 'package:provider/provider.dart';

class ToDo {
  final int id;
  final String title;
  final String description;
  final bool done;
  final bool cancelled;
  final String date;

  ToDo({
    this.id,
    this.title,
    this.cancelled,
    this.date,
    this.description,
    this.done,
  });
  factory ToDo.fromJson(dynamic jsonObject) {
    var todos = jsonObject['products'] as List;

    return ToDo(
      id: jsonObject['id'] as int,
      title: jsonObject['title'] as String,
      description: jsonObject['description'] as String,
      done: jsonObject['done'] as bool,
      cancelled: jsonObject['canceled'] as bool,
      date: jsonObject['date'] as String,
    );
  }
}
