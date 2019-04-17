import 'package:test/test.dart';
import 'package:aqueduct_test/aqueduct_test.dart';
import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';
import 'package:server/src/services/src/db/src/account_table.dart';

import 'harness/dartello_app.dart';

void main() {
  final harness = DartelloAppHarness()..install(restartForEachTest: false);

  test('POST /login', () async {
    final request1 = LoginRequest()
      ..login = 'login1'
      ..password = 'password1';
    final response1 = await harness.agent.post(
        '/login',
        body: request1.asMap(),
    );
    expectResponse(response1, 200, body: {'status': 0});

    final request2 = LoginRequest()
      ..login = 'loginx'
      ..password = 'password1';
    final response2 = await harness.agent.post(
      '/login',
      body: request2.asMap(),
    );
    expectResponse(response2, 200, body: {'status': 1});
  }, skip: 'TODO:');

  test('POST /registration', () async {
    final request = LoginRequest()
      ..login = 'loginnew'
      ..password = 'passwordnew';
    final response = await harness.agent.post(
      '/registration',
      body: request.asMap(),
    );
    expectResponse(response, 200, body: {'status': 0});

    final account = await (Query<AccountTable>(harness.context)
      ..where((AccountTable account) => account.login).equalTo(request.login)).fetchOne();
    expect(account.login, request.login);
    expect(account.password, request.password);
  }, skip: 'TODO:';

// TODO: tests for
//  ..route('/exists_login').link(() => ExistsLoginController(diInjector))
//  ..route('/has_team').link(() => HasTeamController(diInjector))
//  ..route('/create_team').link(() => CreateTeamController(diInjector))
//  ..route('/exists_team').link(() => ExistsTeamController(diInjector))
//  ..route('/get_dashboard').link(() => GetDashboardController(diInjector))
//  ..route('/create_group').link(() => CreateGroupController(diInjector))
//  ..route('/delete_group').link(() => DeleteGroupController(diInjector))
//  ..route('/create_task').link(() => CreateTaskController(diInjector))
//  ..route('/delete_task').link(() => DeleteTaskController(diInjector))
//  ..route('/get_settings').link(() => GetSettingsController(diInjector))
//  ..route('/append_account_to_team').link(() => AppendAccountToTeamController(diInjector))
//  ..route('/delete_account_from_team').link(() => DeleteAccountFromTeamController(diInjector));
}