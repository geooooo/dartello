import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';
import 'logger_resource_controller.dart';

class DeleteGroupController extends LoggerResourceController {

  final DiInjector _diInjector;

  DeleteGroupController(this._diInjector);

  @Operation.post()
  Future<Response> deleteGroup(@Bind.body() DeleteGroupRequest request) async {
    _diInjector.logger.logRestApi(super.method, super.uri, request.asMap());

    _diInjector.db.deleteGroup(request.groupTitle, request.teamTitle);
    final response = DeleteGroupResponse();
    return Response.ok(response);
  }

}
