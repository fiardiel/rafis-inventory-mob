import 'package:flutter/material.dart';
import 'package:rafis_inventory_mobile/models/product.dart';
import 'package:rafis_inventory_mobile/screens/additem_form.dart';
import 'package:rafis_inventory_mobile/widgets/left_drawer.dart';
import 'package:rafis_inventory_mobile/widgets/item_card.dart';

class ViewItemPage extends StatefulWidget {
  const ViewItemPage({Key? key}) : super(key: key);

  @override
  State<ViewItemPage> createState() => _ViewItemPageState();
}

class _ViewItemPageState extends State<ViewItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Items'),
      ),
      body: (() {
        if (products.isEmpty) {
          return const Center(
            child: Text("No items found!"),
          );
        } 
        else {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductCard(products[index]);
            },
          );
        }
      })(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ItemFormPage()));
        },
        child: const Icon(Icons.add),
      ),
      drawer: const LeftDrawer(),
    );
  }
}

List<Product> products = [];
