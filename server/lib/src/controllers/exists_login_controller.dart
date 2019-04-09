import 'package:aqueduct/aqueduct.dart';
import '../models/exists_login.dart';

class ExistsLoginController extends ResourceController {

  @Operation.post()
  Future<Response> existsLogin(@Bind.body() ExistsLoginRequest request) async {
    print(request.asMap());
    final response = ExistsLoginResponse();
    return Response.ok(response);
  }

}

