import 'package:drift/drift.dart';


@DataClassName('PriceTable')
class Prices extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get costPrice => integer()();
  IntColumn get salesPrice => integer()();
  TextColumn get currency => text()();
}
@DataClassName('BrandTable')
class Brands extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text()();
}

@DataClassName('ManufacturerTable')
class Manufacturers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get address => text()();
}

@DataClassName('CategoryTable')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text()();
}

@DataClassName('ProductTable')
class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  IntColumn get priceId => integer().customConstraint('REFERENCES Prices(id)')();
  IntColumn get brandId => integer().customConstraint('REFERENCES Brands(id)')();
  IntColumn get manufacturerId => integer().customConstraint('REFERENCES Manufacturers(id)')();
  IntColumn get categoryId => integer().customConstraint('REFERENCES Categories(id)')();
  DateTimeColumn get manufactureDate => dateTime()();
  DateTimeColumn get expiryDate => dateTime().nullable()();
  IntColumn get weight => integer()();
  TextColumn get dimensions => text().nullable()();
}
