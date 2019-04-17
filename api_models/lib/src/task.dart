import 'package:aqueduct/aqueduct.dart';

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
      'responsible_login': responsibleLogin,
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
