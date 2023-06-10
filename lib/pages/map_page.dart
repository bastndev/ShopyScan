import 'package:flutter/material.dart';
import 'package:flutter_qr/providers/db_provider.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScanModel? scan = ModalRoute.of(context)?.settings.arguments as ScanModel?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps'),
      ),
      body: Center(
        child: Text(scan!.valor),
      ),
    );
  }
}
