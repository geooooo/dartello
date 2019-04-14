import 'package:aqueduct/aqueduct.dart';

import 'package:server/src/services/src/db/src/team_table.dart';

class Account extends ManagedObject<_Account> implements _Account {}

class _Account {

  @Column(
    primaryKey: true,
    autoincrement: true,
  )
  int id;

  @Column(
    nullable: false,
    unique: true,
  )
  String login;

  @Column(
    nullable: false,
  )
  String password;

  Team team;

}
