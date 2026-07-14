import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PageMapsDua extends StatefulWidget {
  const PageMapsDua({super.key});

  @override
  State<PageMapsDua> createState() => _PageMapsDuaState();
}

class _PageMapsDuaState extends State<PageMapsDua> {
  late GoogleMapController mapController;

  // Default lokasi (Padang)
  final LatLng _center = const LatLng(-0.9145, 100.4600);

  // Tipe map default
  MapType _currentMapType = MapType.normal;

  // Marker
  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('PNP'),
      position: LatLng(-0.9147, 100.4660),
      infoWindow: InfoWindow(title: 'Politeknik Negeri Padang'),
    ),
    Marker(
      markerId: MarkerId('UNAND'),
      position: LatLng(-0.9140, 100.4590),
      infoWindow: InfoWindow(title: 'Universitas Andalas'),
    ),
    Marker(
      markerId: MarkerId('UNP'),
      position: LatLng(-0.8915, 100.3500),
      infoWindow: InfoWindow(title: 'Universitas Negeri Padang'),
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Fungsi ganti map type
  void _changeMapType(MapType type) {
    setState(() {
      _currentMapType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 12.0,
            ),
            mapType: _currentMapType,
            markers: _markers,
          ),

          // Tombol pilihan tipe map
          Positioned(
            top: 10,
            right: 10,
            child: Column(
              children: [
                _mapButton('Normal', MapType.normal),
                _mapButton('Satellite', MapType.satellite),
                _mapButton('Hybrid', MapType.hybrid),
                _mapButton('Terrain', MapType.terrain),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _mapButton(String title, MapType type) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        onPressed: () => _changeMapType(type),
        child: Text(title),
      ),
    );
  }
}