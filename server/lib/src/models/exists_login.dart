
import 'package:aqueduct/aqueduct.dart' hide Response;
import 'response.dart';

class ExistsLoginRequest extends Serializable {

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
//    0 - логин существует
//    1 - не существует
class ExistsLoginResponse extends Response {}
