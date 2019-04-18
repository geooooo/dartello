import 'package:aqueduct/aqueduct.dart';

import 'package:api_models/src/task.dart';

class Group extends Serializable {

  String title = '';
  List<Task> tasks;

  @override
  Map<String, dynamic> asMap() => {
      'title': title,
      'tasks': tasks?.map((task) => task.asMap())?.toList(),
  };

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    title = inputMap['title'];
    final Iterable<Map<String, dynamic>> tasksMap = inputMap['tasks'];
    tasks = (tasksMap == null)? [] : tasksMap.map((task) => Task().readFromMap(task));
  }

}
