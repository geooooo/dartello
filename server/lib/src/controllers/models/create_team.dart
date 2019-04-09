import 'package:aqueduct/aqueduct.dart' hide Response;
import 'response.dart';

class CreateTeamRequest extends Serializable {

  String login;
  String title;

  @override
  Map<String, dynamic> asMap() => {
      'login': login,
      'title': title,
  };

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    login = inputMap['login'];
    title = inputMap['title'];
  }

}

// status:
//   0 - ок
class CreateTeamResponse extends Response {}
