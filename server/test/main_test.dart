import 'package:server/src/services/src/db/src/group_table.dart';
import 'package:server/src/services/src/db/src/task_table.dart';
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
  restCreateTeamTest();
  restCreateGroupTest();
  restCreateTaskTest();
  restDeleteGroupTest();
  restDeleteTaskTest();
  restGetDashboardTest();
  restGetSettingsTest();
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
    expect(account.team, isNull);
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

void restCreateTeamTest() {
  test('POST /create_team', () async {
    final request = CreateTeamRequest()
      ..title = 'teamnew'
      ..login = 'login1';
    final response = await harness.agent.post(
      '/create_team',
      body: request.asMap(),
    );
    expectResponse(
        response,
        200,
        body: (CreateTeamResponse()
          ..status = 0).asMap()
    );

    final team = await (Query<TeamTable>(harness.context)
      ..where((TeamTable team) => team.title).equalTo(request.title)
    ).fetchOne();
    expect(team.title, request.title);

    final teamId = team.id;
    final account = await (Query<AccountTable>(harness.context)
      ..where((AccountTable account) => account.login).equalTo(request.login)
    ).fetchOne();
    expect(account.team.id, teamId);
  }, skip: 'TODO');
}

void restCreateGroupTest() {
  test('POST /create_group', () async {
    final request = CreateGroupRequest()
      ..teamTitle = 'team1'
      ..group = (Group()
        ..title = 'groupnew');
    final response = await harness.agent.post(
      '/create_group',
      body: request.asMap(),
    );
    expectResponse(
        response,
        200,
        body: (CreateGroupResponse()
          ..status = 0).asMap()
    );

    final team = await (Query<TeamTable>(harness.context)
      ..where((TeamTable team) => team.title).equalTo(request.teamTitle)
    ).fetchOne();
    final dashboardId = team.dashboard.id;
    final group = await (Query<GroupTable>(harness.context)
      ..where((GroupTable group) => group.dashboard.id).equalTo(dashboardId)
      ..where((GroupTable group) => group.title).equalTo(request.group.title)
    ).fetchOne();
    expect(group.title, request.group.title);
  }, skip: 'TODO');
}

void restCreateTaskTest() {
  test('POST /create_task', () async {
    final request = CreateTaskRequest()
      ..teamTitle = 'team1'
      ..groupTitle = 'group1'
      ..task = (Task()
        ..title = 'tasknew'
        ..description = 'description'
        ..priority = 1
        ..timePoint = 2
        ..responsibleLogin = 'login1');
    final response = await harness.agent.post(
      '/create_task',
      body: request.asMap(),
    );
    expectResponse(
        response,
        200,
        body: (CreateTaskResponse()
          ..status = 0).asMap()
    );

    final task = await (Query<TaskTable>(harness.context)
      ..where((TaskTable task) => task.title).equalTo(request.task.title)
    ).fetchOne();
    final groupId = task.group.id;
    final group = await (Query<GroupTable>(harness.context)
      ..where((GroupTable group) => group.id).equalTo(groupId)
      ..where((GroupTable group) => group.title).equalTo(request.groupTitle)
    ).fetchOne();
    final dashboardId = group.dashboard.id;
    final team = await (Query<TeamTable>(harness.context)
      ..where((TeamTable team) => team.title).equalTo(request.teamTitle)
    ).fetchOne();
    expect(team.dashboard.id, dashboardId);
  }, skip: 'TODO');
}

void restDeleteGroupTest() {
  test('POST /delete_group', () async {
    final request = DeleteGroupRequest()
      ..teamTitle = 'team1'
      ..groupTitle = 'group1';
    final response = await harness.agent.post(
      '/delete_group',
      body: request.asMap(),
    );
    expectResponse(
        response,
        200,
        body: (CreateTaskResponse()
          ..status = 0).asMap()
    );

    final team = await (Query<TeamTable>(harness.context)
      ..where((TeamTable team) => team.title).equalTo(request.teamTitle)
    ).fetchOne();
    final dashboardId = team.dashboard.id;
    final group = await (Query<GroupTable>(harness.context)
      ..where((GroupTable group) => group.title).equalTo(request.groupTitle)
      ..where((GroupTable group) => group.dashboard.id).equalTo(dashboardId)
    ).fetchOne();
    expect(group, isNull);
  }, skip: 'TODO');
}

void restDeleteTaskTest() {
  test('POST /delete_task', () async {
    final request = DeleteTaskRequest()
      ..teamTitle = 'team1'
      ..groupTitle = 'group1'
      ..taskTitle = 'task1';
    final response = await harness.agent.post(
      '/delete_task',
      body: request.asMap(),
    );
    expectResponse(
        response,
        200,
        body: (CreateTaskResponse()
          ..status = 0).asMap()
    );

    final team = await (Query<TeamTable>(harness.context)
      ..where((TeamTable team) => team.title).equalTo(request.teamTitle)
    ).fetchOne();
    final dashboardId = team.dashboard.id;
    final group = await (Query<GroupTable>(harness.context)
      ..where((GroupTable group) => group.title).equalTo(request.groupTitle)
      ..where((GroupTable group) => group.dashboard.id).equalTo(dashboardId)
    ).fetchOne();
    final groupId = group.id;
    final task = await (Query<TaskTable>(harness.context)
      ..where((TaskTable task) => task.title).equalTo(request.taskTitle)
      ..where((TaskTable task) => task.group.id).equalTo(groupId)
    ).fetchOne();
    expect(task, isNull);
  }, skip: 'TODO');
}

void restGetDashboardTest() {
  test('POST /get_dashboard', () async {
    final request = GetDashboardRequest()
      ..login = 'login1';
    final response = await harness.agent.post(
      '/get_dashboard',
      body: request.asMap(),
    );
    final group1 = Group()
      ..title = harness.group1.title
      ..tasks = <Task>[
        Task()
          ..title = harness.task1.title
          ..description = harness.task1.description
          ..timePoint = harness.task1.timePoint
          ..priority = harness.task1.priority
          ..responsibleLogin = harness.account1.login,
        Task()
          ..title = harness.task2.title
          ..description = harness.task2.description
          ..timePoint = harness.task2.timePoint
          ..priority = harness.task2.priority
          ..responsibleLogin = harness.account2.login,
      ];
    final group2 = Group()
      ..title = harness.group2.title
      ..tasks = <Task>[
        Task()
          ..title = harness.task3.title
          ..description = harness.task3.description
          ..timePoint = harness.task3.timePoint
          ..priority = harness.task3.priority
          ..responsibleLogin = harness.account3.login,
      ];
    expectResponse(
        response,
        200,
        body: (GetDashboardResponse()
          ..status = 0
          ..title = harness.team1.title
          ..groups = <Group>[
            group1,
            group2,
          ]
        ).asMap()
    );
  }, skip: 'TODO');
}

void restGetSettingsTest() {
  test('POST /get_settings', () async {
    final request = GetSettingsRequest()
     ;
    final response = await harness.agent.post(
      '/get_settings',
      body: request.asMap(),
    );
    expectResponse(
        response,
        200,
        body: (GetSettingsResponse()
          ..status = 0).asMap()
    );
  });
}