import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration1 extends Migration { 
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("_AccountTable", [SchemaColumn("id", ManagedPropertyType.integer, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("login", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true),SchemaColumn("password", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("_DashboardTable", [SchemaColumn("id", ManagedPropertyType.integer, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("_GroupTable", [SchemaColumn("id", ManagedPropertyType.integer, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("title", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("_TaskTable", [SchemaColumn("id", ManagedPropertyType.integer, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("title", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("description", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("priority", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("timePoint", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("_TeamTable", [SchemaColumn("id", ManagedPropertyType.integer, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("title", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true)]));
		database.addColumn("_AccountTable", SchemaColumn.relationship("task", ManagedPropertyType.integer, relatedTableName: "_TaskTable", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: true));
		database.addColumn("_DashboardTable", SchemaColumn.relationship("group", ManagedPropertyType.integer, relatedTableName: "_GroupTable", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: true));
		database.addColumn("_DashboardTable", SchemaColumn.relationship("team", ManagedPropertyType.integer, relatedTableName: "_TeamTable", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: true));
		database.addColumn("_GroupTable", SchemaColumn.relationship("task", ManagedPropertyType.integer, relatedTableName: "_TaskTable", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: true));
		database.addColumn("_TeamTable", SchemaColumn.relationship("account", ManagedPropertyType.integer, relatedTableName: "_AccountTable", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: true));
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    