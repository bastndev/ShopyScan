import 'package:flutter/material.dart';
import 'package:flutter_qr/providers/scan_tiles.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const ScanTiles(type: 'geo');
    
  }
}