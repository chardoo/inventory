import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory/Database/database.dart';
import 'package:inventory/features/feature_products/provider/states/notifier_state.dart';

class ProductsNotifier extends Notifier<IProductNotifierState> {
  @override
  IProductNotifierState build() => const InitialNotifierState();

  Future<void> addProduct() async {
    final db = ref.read(database);
    state = const FetchingProducts();
    Random random = Random();
    var val = random.nextInt(10000);
    await db.into(db.products).insert(ProductsCompanion.insert(
          name: 'product $val',
          description: 'desc',
          manufactureDate: DateTime.now(),
          weight: 20,
        ));
    final allProducts = await db.select(db.products).get();
    state = FetchedProducts(allProducts);
  }
}


final productNotifierProvider = NotifierProvider<ProductsNotifier, IProductNotifierState>(ProductsNotifier.new);