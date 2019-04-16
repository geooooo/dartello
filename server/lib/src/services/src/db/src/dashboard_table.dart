import 'package:aqueduct/aqueduct.dart';
import 'package:server/src/services/src/db/src/group_table.dart';

import 'team_table.dart';
import 'group_table.dart';

class DashboardTable extends ManagedObject<_DashboardTable> implements _DashboardTable {}

class _DashboardTable {

  @Column(
    primaryKey: true,
    autoincrement: true,
  )
  int id;

  TeamTable team;
  ManagedSet<GroupTable> groups;

}