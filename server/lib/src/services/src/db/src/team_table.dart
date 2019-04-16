import 'package:aqueduct/aqueduct.dart';

import 'account_table.dart';
import 'dashboard_table.dart';

class TeamTable extends ManagedObject<_TeamTable> implements _TeamTable {}

class _TeamTable {

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

  @Relate(#team)
  DashboardTable dashboard;

  ManagedSet<AccountTable> account;

}