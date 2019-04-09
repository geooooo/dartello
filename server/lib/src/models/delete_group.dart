import 'package:aqueduct/aqueduct.dart' hide Response;
import 'response.dart';

class DeleteGroupRequest extends Serializable {

  String teamTitle;
  String groupTitle;

  @override
  Map<String, dynamic> asMap() => {
      'team_title': teamTitle,
      'group_title': groupTitle,
  };

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    teamTitle = inputMap['team_title'];
    groupTitle = inputMap['group_title'];
  }

}

// status:
//   0 - ок
class DeleteGroupResponse extends Response {}
