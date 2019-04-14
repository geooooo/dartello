import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';
import 'logger_resource_controller.dart';

class GetDashboardController extends LoggerResourceController {

  final DiInjector _diInjector;

  GetDashboardController(this._diInjector);

  @Operation.post()
  Future<Response> getDashboard(@Bind.body() GetDashboardRequest request) async {
    _diInjector.logger.logRestApi(super.method, super.uri, request.asMap());

    final data = _diInjector.db.selectDashboard(request.login);
    final response = GetDashboardResponse()
      ..title = data['title']
      ..groups = data['groups'];
    return Response.ok(response);
  }

}

