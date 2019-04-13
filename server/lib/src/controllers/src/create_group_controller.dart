import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class CreateGroupController extends ResourceController {

  final DiInjector _diInjector;

  CreateGroupController(this._diInjector);

  @Operation.post()
  Future<Response> createGroup(@Bind.body() CreateGroupRequest request) async {
    print(request.asMap());
    final response = CreateGroupResponse();
    return Response.ok(response);
  }

}
