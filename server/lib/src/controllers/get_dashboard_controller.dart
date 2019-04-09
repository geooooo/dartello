import 'package:aqueduct/aqueduct.dart';
import 'models/get_dashboard.dart';

class GetDashboardController extends ResourceController {

  @Operation.post()
  Future<Response> createTeam(@Bind.body() GetDashboardRequest request) async {
    print(request.asMap());
    final response = GetDashboardResponse();
    return Response.ok(response);
  }

}

