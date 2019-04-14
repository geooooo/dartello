import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';
import 'logger_resource_controller.dart';

class CreateGroupController extends LoggerResourceController {

  final DiInjector _diInjector;

  CreateGroupController(this._diInjector);

  @Operation.post()
  Future<Response> createGroup(@Bind.body() CreateGroupRequest request) async {
    _diInjector.logger.logRestApi(super.method, super.uri, request.asMap());

    _diInjector.db.createGroup(request.group);
    final response = CreateGroupResponse();
    return Response.ok(response);
  }

}
