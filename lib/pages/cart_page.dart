import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<_CartItem> _items = [
    _CartItem('assets/images/dmc5.jpg', 200),
    _CartItem('assets/images/re8.jpg', 200),
    _CartItem('assets/images/nfs.jpg', 100),
  ];

  int get _total => _items.fold(0, (sum, item) => sum + item.price);

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panier'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: Text(
                'Total : ${_total} TND',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.black),
                  onPressed: () => _removeItem(index),
                ),
              ),
              title: Row(
                children: [
                  Image.asset(item.image, width: 180, height: 80),
                  const SizedBox(width: 16),
                  Text('${item.price} TND', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CartItem {
  final String image;
  final int price;
  _CartItem(this.image, this.price);
}
