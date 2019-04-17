import 'package:server/src/services/src/db/src/team_table.dart';
import 'package:test/test.dart';
import 'package:aqueduct_test/aqueduct_test.dart';
import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';
import 'package:server/src/services/src/db/src/account_table.dart';

import 'harness/dartello_app.dart';

DartelloAppHarness harness;

void main() {
  harness = DartelloAppHarness()..install(restartForEachTest: false);

  restLoginTest();
  restRegistrationTest();
  restLoginExistsTest();
  restHasTeamTest();
  restExistsTeamTest();
  restDeleteAccountFromTeamTest();
  restAppendAccountToTeamTest();

// TODO: tests for
//  ..route('/create_team').link(() => CreateTeamController(diInjector))
//  ..route('/get_dashboard').link(() => GetDashboardController(diInjector))
//  ..route('/create_group').link(() => CreateGroupController(diInjector))
//  ..route('/delete_group').link(() => DeleteGroupController(diInjector))
//  ..route('/create_task').link(() => CreateTaskController(diInjector))
//  ..route('/delete_task').link(() => DeleteTaskController(diInjector))
//  ..route('/get_settings').link(() => GetSettingsController(diInjector))
}

void restLoginTest() {
  test('POST /login', () async {
    final request1 = LoginRequest()
      ..login = 'login1'
      ..password = 'password1';
    final response1 = await harness.agent.post(
      '/login',
      body: request1.asMap(),
    );
    expectResponse(
        response1,
        200,
        body: (LoginReponse()..status = 0).asMap()
    );

    final request2 = LoginRequest()
      ..login = 'loginx'
      ..password = 'password1';
    final response2 = await harness.agent.post(
      '/login',
      body: request2.asMap(),
    );
    expectResponse(
        response2,
        200,
        body: (LoginReponse()..status = 1).asMap()
    );
  }, skip: 'TODO');
}

void restRegistrationTest() {
  test('POST /registration', () async {
    final request = RegistrationRequest()
      ..login = 'loginnew'
      ..password = 'passwordnew';
    final response = await harness.agent.post(
      '/registration',
      body: request.asMap(),
    );
    expectResponse(
        response,
        200,
        body: (RegistrationResponse()..status = 0).asMap()
    );

    final account = await (Query<AccountTable>(harness.context)
      ..where((AccountTable account) => account.login).equalTo(request.login)).fetchOne();
    expect(account.login, request.login);
    expect(account.password, request.password);
  }, skip: 'TODO');
}

void restLoginExistsTest() {
  test('POST /exists_login', () async {
    final request1 = ExistsLoginRequest()
      ..login = 'login1';
    final response1 = await harness.agent.post(
      '/exists_login',
      body: request1.asMap(),
    );
    expectResponse(
        response1,
        200,
        body: (ExistsLoginResponse()..status = 0).asMap()
    );

    final request2 = ExistsLoginRequest()
      ..login = 'loginx';
    final response2 = await harness.agent.post(
      '/exists_login',
      body: request2.asMap(),
    );
    expectResponse(
        response2,
        200,
        body: (ExistsLoginResponse()..status = 1).asMap()
    );
  }, skip: 'TODO');
}

void restHasTeamTest() {
  test('POST /has_team', () async {
    final request1 = HasTeamRequest()
      ..login = 'login1';
    final response1 = await harness.agent.post(
      '/has_team',
      body: request1.asMap(),
    );
    expectResponse(
        response1,
        200,
        body: (HasTeamResponse()..status = 1).asMap()
    );

    final request2 = HasTeamRequest()
      ..login = 'login3';
    final response2 = await harness.agent.post(
      '/has_team',
      body: request2.asMap(),
    );
    expectResponse(
        response2,
        200,
        body: (ExistsLoginResponse()..status = 1).asMap()
    );
  }, skip: 'TODO');
}

void restExistsTeamTest() {
  test('POST /exists_team', () async {
    final request1 = ExistsTeamRequest()
      ..title = 'team1';
    final response1 = await harness.agent.post(
      '/exists_team',
      body: request1.asMap(),
    );
    expectResponse(
        response1,
        200,
        body: (ExistsTeamResponse()..status = 1).asMap()
    );

    final request2 = ExistsTeamRequest()
      ..title = 'teamx';
    final response2 = await harness.agent.post(
      '/exists_team',
      body: request2.asMap(),
    );
    expectResponse(
        response2,
        200,
        body: (ExistsTeamResponse()..status = 1).asMap()
    );
  }, skip: 'TODO');
}

void restDeleteAccountFromTeamTest() {
  test('POST /delete_account_from_team', () async {
    final request = DeleteAccountFromTeamRequest()
      ..teamTitle = 'team1'
      ..login = 'login1';
    final response = await harness.agent.post(
      '/delete_account_from_team',
      body: request.asMap(),
    );
    expectResponse(
        response,
        200,
        body: (DeleteAccountFromTeamResponse()..status = 0).asMap()
    );

    final account = await (Query<AccountTable>(harness.context)
      ..where((AccountTable account) => account.login).equalTo(request.login)
    ).fetchOne();
    expect(account.team, null);
  }, skip: 'TODO');
}

void restAppendAccountToTeamTest() {
  test('POST /append_account_to_team', () async {
    final request = AppendAccountToTeamRequest()
      ..teamTitle = 'team2'
      ..login = 'login1';
    final response = await harness.agent.post(
      '/append_account_to_team',
      body: request.asMap(),
    );
    expectResponse(
        response,
        200,
        body: (AppendAccountToTeamResponse()
          ..status = 0).asMap()
    );

    final account = await (Query<AccountTable>(harness.context)
      ..where((AccountTable account) => account.login).equalTo(request.login)
    ).fetchOne();
    final teamId = account.team.id;
    final team = await (Query<TeamTable>(harness.context)
      ..where((TeamTable team) => team.id).equalTo(teamId)
    ).fetchOne();
    final teamTitle = team.title;
    expect(request.teamTitle, teamTitle);
  }, skip: 'TODO');
}
