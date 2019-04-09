import 'package:aqueduct/aqueduct.dart' hide Response;
import 'response.dart';

class HasTeamRequest extends Serializable {

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
//   0 - пользователь находится в команде
//   1 - не находится
class HasTeamResponse extends Response {}
