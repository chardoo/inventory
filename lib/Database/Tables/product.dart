import 'package:drift/drift.dart';



class Prices extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get costPrice => integer()();
  IntColumn get salesPrice => integer()();
  TextColumn get currency => text()();
}


class Brands extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text()();
}


class Manufacturers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get address => text()();
}

@DataClassName('ProductCategory')
class ProductCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text()();
}

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  IntColumn get priceId => integer().nullable().references(Prices, #id)();
  IntColumn get brandId => integer().nullable().references(Brands, #id)();
  IntColumn get manufacturerId => integer().nullable().references(Manufacturers, #id)();
  IntColumn get categoryId => integer().nullable().references(ProductCategories, #id)();
  DateTimeColumn get manufactureDate => dateTime()();
  DateTimeColumn get expiryDate => dateTime().nullable()();
  IntColumn get weight => integer()();
  TextColumn get dimensions => text().nullable()();
}
