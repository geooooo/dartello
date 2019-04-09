import 'package:aqueduct/aqueduct.dart';

class Response extends Serializable {

  bool status;

  Map<String, dynamic> asMap() => {
      "status": status,
  };

  void readFromMap(Map<String, dynamic> inputMap) {
    status = inputMap['status'];
  }

}
