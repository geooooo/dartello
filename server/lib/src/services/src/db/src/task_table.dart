import 'package:aqueduct/aqueduct.dart';

import 'account_table.dart';
import 'group_table.dart';

class TaskTable extends ManagedObject<_TaskTable> implements _TaskTable {}

class _TaskTable {

  @Column(
    primaryKey: true,
    autoincrement: true,
  )
  int id;

  @Column(
    nullable: false,
  )
  String title;

  @Column(
    nullable: false,
  )
  String description;

  @Column(
    nullable: false,
    validators: [
      Validate.length(
        greaterThanEqualTo: 1,
        lessThanEqualTo: 3,
      ),
    ],
  )
  String priority;

  @Column(
    nullable: false,
    validators: [
      Validate.length(
        greaterThanEqualTo: 0,
        lessThanEqualTo: 100,
      ),
    ],
  )
  String timePoint;

  @Relate(#tasks)
  GroupTable group;

  @Relate(#task)
  AccountTable account;

}