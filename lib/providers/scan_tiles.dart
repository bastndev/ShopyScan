import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_qr/providers/scan_list_provider.dart';
import 'package:flutter_qr/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String type;

  const ScanTiles({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      // -- -- -- -- Animation Delete
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.grey[100],
        ),
        // --- --- --- --- --- ---Delete
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .deleteScanId(scans[i].id);
        },
        // --- -- --- --- -- --  Icon GEO and LOCATION 
        child: ListTile(
          leading: Icon(
          type == 'http'
            ? Icons.maps_ugc
            : Icons.line_axis,
          color: Colors.red
          ),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () => launchURL(context, scans [i]),
        ),
      ),
    );
  }
}
