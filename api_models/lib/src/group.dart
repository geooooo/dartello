import 'package:aqueduct/aqueduct.dart';

import 'package:api_models/src/task.dart';

class Group extends Serializable {

  String teamTitle = '';
  String title = '';
  List<Task> tasks = [];

  @override
  Map<String, dynamic> asMap() => {
      'team_title': teamTitle,
      'title': title,
      'tasks': tasks.map((task) => task.asMap()).toList(),
  };

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    teamTitle = inputMap['team_title'];
    title = inputMap['title'];
    final Iterable<Map<String, dynamic>> tasksMap = inputMap['tasks'];
    tasks = (tasksMap == null)? [] : tasksMap.map((task) => Task().readFromMap(task));
  }

}
