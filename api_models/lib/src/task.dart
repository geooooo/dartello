import 'package:aqueduct/aqueduct.dart';

class Task extends Serializable {

  String groupTitle = '';
  String title = '';
  String description = '';
  String responsibleLogin = '';
  int timePoint = 0;
  int priority = 0;

  @override
  Map<String, dynamic> asMap() => {
      'group_title': groupTitle,
      'title': title,
      'description': description,
      'time_point': timePoint,
      'priority': priority,
      'responsible_login': responsibleLogin,
  };

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    groupTitle = inputMap['group_title'];
    title = inputMap['title'];
    description = inputMap['description'];
    timePoint = inputMap['time_point'];
    priority = inputMap['priority'];
    responsibleLogin = inputMap['responsible_login'];
  }

}
