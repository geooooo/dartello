import 'package:aqueduct/aqueduct.dart';

import 'dashboard_table.dart';
import 'task_table.dart';

class GroupTable extends ManagedObject<_GroupTable> implements _GroupTable {}

class _GroupTable {

  @Column(
    primaryKey: true,
    autoincrement: true,
  )
  int id;

  @Column(
    nullable: false,
  )
  String title;

  DashboardTable dashboard;

  @Relate(#group)
  TaskTable task;

}
