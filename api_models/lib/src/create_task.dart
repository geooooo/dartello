import 'package:aqueduct/aqueduct.dart' hide Response;

import 'package:api_models/src/response.dart';
import 'package:api_models/src/task.dart';

class CreateTaskRequest extends Serializable {

  String teamTitle;
  String groupTitle;
  Task task = Task();

  @override
  Map<String, dynamic> asMap() => {
      'team_title': teamTitle,
      'group_title': groupTitle,
      'task': task.asMap(),
  };

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    teamTitle = inputMap['team_title'];
    groupTitle = inputMap['group_title'];
    task.readFromMap(inputMap['task']);
  }

}

// status:
//   0 - ок
class CreateTaskResponse extends Response {}
