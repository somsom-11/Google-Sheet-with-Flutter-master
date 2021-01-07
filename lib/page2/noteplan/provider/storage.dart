import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:Google_Sheet_with_Flutter/page2/noteplan/model/model.dart';
import 'package:path_provider/path_provider.dart';


class FileStorage {
  final String tag = '__todos__';

  Future<File> _getLocalFile() async {
    final dir = await getDirectory();

    return File('${dir.path}/ArchSampleStorage__$tag.json');
  }


  Future<List<TodoModel>> loadTodos() async {
    try {
      final file = await _getLocalFile();
      final string = await file.readAsString();
      final json = await jsonDecode(string);
      final todos = TodoList.fromJson(json);
      return todos.todos;
    } catch (e) {
      print('not init');
      return TodoList([
        TodoModel(title: 'Welcome to Simple Todo', )
      ]).todos;
    }
  }

  Future<File> saveTodos(List<TodoModel> todos) async {
    final file = await _getLocalFile();
    TodoList temp = TodoList(todos);
    return file.writeAsString(jsonEncode(temp));
  }

}

Future<Directory> getDirectory() async {
  Directory path = await getApplicationDocumentsDirectory();
  if (path == null) {
    return null;
  }
  return path;
}
