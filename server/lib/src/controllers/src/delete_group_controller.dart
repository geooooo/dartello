import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class DeleteGroupController extends ResourceController {

  final DiInjector _diInjector;

  DeleteGroupController(this._diInjector);

  @Operation.post()
  Future<Response> deleteGroup(@Bind.body() DeleteGroupRequest request) async {
    _diInjector.logger.logRestApi(this.request.method, this.request.path.string, request.asMap());
    await _diInjector.db.deleteGroup(request.groupTitle, request.teamTitle);
    final response = DeleteGroupResponse();
    return Response.ok(response);
  }

}
