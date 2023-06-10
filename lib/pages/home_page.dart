import 'package:flutter/material.dart';
import 'package:flutter_qr/pages/address_page.dart';
import 'package:flutter_qr/pages/maps_page.dart';
// import 'package:flutter_qr/providers/db_provider.dart';
import 'package:flutter_qr/providers/scan_list_provider.dart';

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
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false).deleteAll();
            },
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

    // --- -- -- -- Use Scan  List Provider
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    
    switch (currentIndex) {
      case 0:
      scanListProvider.loadingType('geo');
        return const MapsPage();

      case 1:
      scanListProvider.loadingType('http');
        return const AddressPage();

      default:
        return const MapsPage();
    }
  }
}
