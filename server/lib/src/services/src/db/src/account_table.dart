import 'package:aqueduct/aqueduct.dart';

import 'team_table.dart';
import 'task_table.dart';

class AccountTable extends ManagedObject<_AccountTable> implements _AccountTable {}

class _AccountTable {

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

  TeamTable team;

  @Relate(#account)
  TaskTable task;

}
