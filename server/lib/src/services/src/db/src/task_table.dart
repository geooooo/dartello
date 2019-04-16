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
      Validate.compare(
        greaterThanEqualTo: 1,
        lessThanEqualTo: 3,
      ),
    ],
  )
  int priority;

  @Column(
    nullable: false,
    validators: [
      Validate.compare(
        greaterThanEqualTo: 0,
        lessThanEqualTo: 100,
      ),
    ],
  )
  int timePoint;

  @Relate(#tasks)
  GroupTable group;

  @Relate(#task)
  AccountTable account;

}