import 'package:aqueduct/aqueduct.dart' hide Response;

import 'package:api_models/src/response.dart';
import 'package:api_models/src/task.dart';

class CreateTaskRequest extends Serializable {

  Task task = Task();

  @override
  Map<String, dynamic> asMap() => {
      'task': task.asMap(),
  };

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    task.readFromMap(inputMap['task']);
  }

}

// status:
//   0 - ок
class CreateTaskResponse extends Response {}
