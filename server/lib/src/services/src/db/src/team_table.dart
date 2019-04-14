import 'package:aqueduct/aqueduct.dart';

import 'package:server/src/services/src/db/src/account_table.dart';
import 'package:server/src/services/src/db/src/dashboard_table.dart';

class Team extends ManagedObject<_Team> implements _Team {}

class _Team {

  @Column(
    primaryKey: true,
    autoincrement: true,
  )
  int id;

  @Column(
    nullable: false,
    unique: true,
  )
  String title;

  Dashboard dashboard;

  @Relate(#team)
  Account account;

}