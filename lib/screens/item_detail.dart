import 'package:flutter/material.dart';
import 'package:rafis_inventory_mobile/models/item.dart';
import 'package:rafis_inventory_mobile/widgets/left_drawer.dart';

class ItemDetailPage extends StatelessWidget {
  final Item item;

  const ItemDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
        automaticallyImplyLeading: false, // Remove back button
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.fields.name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text("Amount: ${item.fields.amount}"),
            SizedBox(height: 10),
            Text("Description: ${item.fields.description}"),
            SizedBox(height: 10),
            Text("Category: ${item.fields.category}"),
            SizedBox(height: 10),
            Text("Damage: ${item.fields.damage}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the item list page
              },
              child: Text('Back to Item List'),
            ),
          ],
        ),
      ),
    );
  }
}
