import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory/Database/Tables/customer.dart';
import 'package:inventory/Database/Tables/product.dart';
import 'package:inventory/Database/Tables/user.dart';
import 'package:inventory/Database/connection/native.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  Customers,
  Users,
  Products,
  ProductCategories,
  CustomerCategories,
  Roles,
  Prices,
  Brands,
  Manufacturers,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connect());

  @override
  int get schemaVersion => 1;
}

final database = Provider((ref) => AppDatabase());
