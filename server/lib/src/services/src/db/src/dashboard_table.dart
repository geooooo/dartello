import 'package:aqueduct/aqueduct.dart';

import 'team_table.dart';
import 'group_table.dart';

class DashboardTable extends ManagedObject<_DashboardTable> implements _DashboardTable {}

class _DashboardTable {

  @Column(
    primaryKey: true,
    autoincrement: true,
  )
  int id;

  @Relate(#dashboard)
  GroupTable group;

  @Relate(#dashboard)
  TeamTable team;

}