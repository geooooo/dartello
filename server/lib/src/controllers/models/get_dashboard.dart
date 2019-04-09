import 'package:aqueduct/aqueduct.dart' hide Response;
import 'response.dart';

class GetDashboardRequest extends Serializable {

  String login;

  @override
  Map<String, dynamic> asMap() => {
      'login': login,
  };

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    login = inputMap['login'];
  }

}

// status:
//   0 - ок
class GetDashboardResponse extends Response {

  String title = '';
  List<Group> groups = [Group(), Group(), Group()];

  @override
  Map<String, dynamic> asMap() => super.asMap()..addAll({
      'title': title,
      'groups': groups.map((group) => group.asMap()).toList(),
  });

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    super.readFromMap(inputMap);
    title = inputMap['title'];
    final Iterable<Map<String, dynamic>> groupsMap = inputMap['groups'];
    groups = groupsMap.map((group) => Group().readFromMap(group));
  }

}

class Group extends Serializable {

  String title = '';
  List<Task> tasks = [Task(), Task()];

  @override
  Map<String, dynamic> asMap() => {
      'title': title,
      'tasks': tasks.map((task) => task.asMap()).toList(),
  };

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    title = inputMap['title'];
    final Iterable<Map<String, dynamic>> tasksMap = inputMap['tasks'];
    tasks = tasksMap.map((task) => Task().readFromMap(task));
  }

}

class Task extends Serializable {

  String title = '';
  String description = '';
  String responsibleLogin = '';
  int timePoint = 0;
  int priority = 0;

  @override
  Map<String, dynamic> asMap() => {
      'title': title,
      'description': description,
      'time_point': timePoint,
      'priority': priority,
      'responsibleLogin': responsibleLogin,
  };

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    title = inputMap['title'];
    description = inputMap['description'];
    timePoint = inputMap['time_point'];
    priority = inputMap['priority'];
    responsibleLogin = inputMap['responsible_login'];
  }

}
