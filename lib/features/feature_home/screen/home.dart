import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory/Database/database.dart';
import 'package:inventory/features/feature_products/feature_products.dart';
import 'package:inventory/features/feature_products/provider/states/notifier_state.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var productsState = ref.watch(productNotifierProvider);
    var products = <Product>[];

    if(productsState is FetchedProducts) {
      products.clear();
      products.addAll(productsState.products);
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Align(child: Text('Tap on add button to add product')),
              Visibility(
                  visible: productsState is FetchingProducts,
                  child: const Align(child: CircularProgressIndicator())),
              Expanded(child: ListView(
                children: products.map((e) => Text(e.name)).toList(),
              ))
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          ref.read(productNotifierProvider.notifier).addProduct();
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
