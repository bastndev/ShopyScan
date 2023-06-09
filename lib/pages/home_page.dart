import 'package:flutter/material.dart';
import 'package:flutter_qr/pages/address_page.dart';
import 'package:flutter_qr/pages/maps_page.dart';

// import 'package:flutter_qr/providers/db_provider.dart';
import 'package:flutter_qr/providers/ui_provider.dart';
// import 'package:flutter_qr/pages/address_page.dart';
// import 'package:flutter_qr/pages/maps_page.dart';
import 'package:flutter_qr/widgets/custom_navigatorbar.dart';
import 'package:flutter_qr/widgets/scan_button.dart';
import 'package:provider/provider.dart';

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
      body: const _HomePageBody(),
      // --- --- --- --- --- Button Navigation Bar
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// --- --- --- --- --- --- --- Home Page Body
class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    // final tempScan =  ScanModel(valor:'http://google.com');
    // DBProvider.db.getAllScan().then( print );
    
    switch (currentIndex) {
      case 0:
        return const MapsPage();

      case 1:
        return const AddressPage();

      default:
        return const MapsPage();
    }
  }
}
