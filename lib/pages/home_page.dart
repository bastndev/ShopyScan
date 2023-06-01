import 'package:flutter/material.dart';
import 'package:flutter_qr/widgets/custom_navigatorbar.dart';
import 'package:flutter_qr/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- --- --- --- --- App Bar
      appBar: AppBar(
        elevation: 0,
        title: const Text('Record'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
          )
        ],
      ),
      // --- --- -- --- --- --- Body
      body: const Center(
        child: Text(
          'Home Page',
        ),
      ),
      // --- --- --- --- --- Button Navigation Bar
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}