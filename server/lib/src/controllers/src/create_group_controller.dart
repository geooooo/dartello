import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class CreateGroupController extends ResourceController {

  final DiInjector _diInjector;

  CreateGroupController(this._diInjector);

  @Operation.post()
  Future<Response> createGroup(@Bind.body() CreateGroupRequest request) async {
    _diInjector.logger.logRestApi(this.request.method, this.request.path.string, request.asMap());
    await _diInjector.db.createGroup(request.group, request.teamTitle);
    final response = CreateGroupResponse();
    return Response.ok(response);
  }

}
