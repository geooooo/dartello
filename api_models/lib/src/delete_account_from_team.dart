import 'package:aqueduct/aqueduct.dart' hide Response;

import 'package:api_models/src/response.dart';

class DeleteAccountFromTeamRequest extends Serializable {

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
class DeleteAccountFromTeamResponse extends Response {}
