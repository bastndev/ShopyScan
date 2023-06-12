import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qr/providers/db_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel? scan =
        ModalRoute.of(context)?.settings.arguments as ScanModel?;

    final CameraPosition startPoint = CameraPosition(
      target: scan!.getLatLng(),
      zoom: 18,
      tilt: 90,
    );
    // --- --- --- -- --- --- Markers
    Set<Marker> markers = <Marker>{};
    markers.add(Marker(
        markerId: const MarkerId('geo-Local'), position: scan.getLatLng()));

// --- --- -- -- -- --- -- --- -- your Location
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your locations'),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_disabled),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              await controller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: scan.getLatLng(), zoom: 18, tilt: 90)));
            },
          ),
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        mapType: mapType,
        markers: markers,
        initialCameraPosition: startPoint,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: const EdgeInsets.only(left: 25.0, bottom: 16.0),

          // --- --- --- -- --- Mode Normal or mode real
          child: FloatingActionButton(
            child: const Icon(Icons.layers),
            onPressed: () {
              if (mapType == MapType.normal){
                mapType = MapType.satellite;
              }else {
                mapType = MapType.normal;
              }
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
