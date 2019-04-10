import 'package:aqueduct/aqueduct.dart' hide Response;
import 'response.dart';

class GetSettingsRequest extends Serializable {

  String login;
  String teamTitle;

  @override
  Map<String, dynamic> asMap() => {
      'login': login,
      'team_title': teamTitle,
  };

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    login = inputMap['login'];
    teamTitle = inputMap['team_title'];
  }

}

// status:
//   0 - ок
class GetSettingsResponse extends Response {

  List<String> logins = [];

  @override
  Map<String, dynamic> asMap() => super.asMap()..addAll({
      'logins': logins,
  });

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    super.readFromMap(inputMap);
    final Iterable<String> loginsMap = inputMap['logins'];
    logins = loginsMap.toList();
  }

}
