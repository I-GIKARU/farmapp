// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class Product {
  String name;
  String description;
  double price;
  int quantity;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
  });
}

class ManageProductsScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Product 1', description: 'Description 1', price: 10.0, quantity: 5),
    Product(name: 'Product 2', description: 'Description 2', price: 20.0, quantity: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('Price: \$${product.price}, Quantity: ${product.quantity}'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProductScreen(product: product)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class EditProductScreen extends StatefulWidget {
  final Product product;

  const EditProductScreen({required this.product});

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _quantityController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.name);
    _descriptionController = TextEditingController(text: widget.product.description);
    _priceController = TextEditingController(text: widget.product.price.toString());
    _quantityController = TextEditingController(text: widget.product.quantity.toString());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _saveProduct() {
    setState(() {
      widget.product.name = _nameController.text;
      widget.product.description = _descriptionController.text;
      widget.product.price = double.parse(_priceController.text);
      widget.product.quantity = int.parse(_quantityController.text);
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Product Description'),
              maxLines: null,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Product Price'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _quantityController,
              decoration: const InputDecoration(labelText: 'Product Quantity'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _saveProduct,
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
