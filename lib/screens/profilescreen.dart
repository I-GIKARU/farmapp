// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'addproductscreen.dart';
import 'manageproductsscreen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to the screen where the user can edit the profile
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()),
              );
            },
            icon: const Icon(Icons.edit), // Icon for editing the profile
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile details
            const Text(
              'Personal Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Name:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text('Jkl', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            const Text(
              'Role:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text('Farmer', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            const Text(
              'Email:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text('jkl@gmail.com', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            // My Products
            const Text(
              'My Products Count',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '10', // Display actual product count here
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            // Manage Products
            ElevatedButton(
              onPressed: () {
                // Navigate to the screen where the user can manage products
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManageProductsScreen()),
                );
              },
              child: const Text(
                'Manage Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            // Add Product
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                ),
                onPressed: () {
                  // Navigate to the screen where the user can add a product
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddProductScreen()),
                  );
                },
                child: const Text(
                  'Add Product',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class EditProfileScreen extends StatefulWidget {
  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _roleController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Jkl'); // Prefilled with existing name
    _roleController = TextEditingController(text: 'Farmer'); // Prefilled with existing role
    _emailController = TextEditingController(text: 'jkl@gmail.com'); // Prefilled with existing email
  }

  @override
  void dispose() {
    _nameController.dispose();
    _roleController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    // Implement save logic here
    Navigator.pop(context); // Return to the previous screen after saving
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _roleController,
              decoration: const InputDecoration(labelText: 'Role'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 24.0),
            Center(
              child: ElevatedButton(
                onPressed: _saveProfile,
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


