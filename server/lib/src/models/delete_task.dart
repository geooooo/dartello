import 'package:aqueduct/aqueduct.dart' hide Response;
import 'response.dart';

class DeleteTaskRequest extends Serializable {

  String taskTitle;
  String groupTitle;
  String teamTitle;

  @override
  Map<String, dynamic> asMap() => {
      'team_title': teamTitle,
      'group_title': groupTitle,
      'task_title': taskTitle,
  };

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    teamTitle = inputMap['team_title'];
    groupTitle = inputMap['group_title'];
    taskTitle = inputMap['task_title'];
  }

}

// status:
//   0 - ок
class DeleteTaskResponse extends Response {}
