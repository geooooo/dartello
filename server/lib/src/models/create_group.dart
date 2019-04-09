import 'package:aqueduct/aqueduct.dart' hide Response;
import 'response.dart';
import 'group.dart';

class CreateGroupRequest extends Serializable {

  Group group = Group();

  @override
  Map<String, dynamic> asMap() => {
      'group': group.asMap(),
  };

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    group.readFromMap(inputMap['group']);
  }

}

// status:
//   0 - ок
class CreateGroupResponse extends Response {}
