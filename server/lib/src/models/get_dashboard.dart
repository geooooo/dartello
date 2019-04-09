import 'package:aqueduct/aqueduct.dart' hide Response;
import 'response.dart';
import 'group.dart';

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
  List<Group> groups = [];

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
