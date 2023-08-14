
import 'package:inventory/Database/database.dart';

abstract class IProductNotifierState {
  const IProductNotifierState();
}

class InitialNotifierState extends IProductNotifierState {
  const InitialNotifierState();
}

class FetchingProducts extends IProductNotifierState {
  const FetchingProducts();
}

class FetchedProducts extends IProductNotifierState {
  const FetchedProducts(this.products);

  final List<Product> products;
}