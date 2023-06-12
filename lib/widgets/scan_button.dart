import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_qr/utils/utils.dart';
import 'package:flutter_qr/providers/scan_list_provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancel',false,ScanMode.QR);

        if (barcodeScanRes == '-1') {
          return;
        }
        // ignore_for_file: use_build_context_synchronously
        final scanListProvider =Provider.of<ScanListProvider>(context, listen: false);
        final newScan = await scanListProvider.newSCan(barcodeScanRes);
        
        launchURL(context, newScan);
      },
    );
  }
}
