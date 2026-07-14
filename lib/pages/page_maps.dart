import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PageMaps extends StatelessWidget {
  const PageMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
        backgroundColor: Colors.green,
      ),
      body: GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(-0.9143640771495936, 100.46616172467249), zoom: 17)),
    );
  }
}

class PageMainMaps extends StatelessWidget {
  const PageMainMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('maps'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageMaps()),
                );
              },
              child: Text("Maps Pertama"),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageMaps()),
                );
              },
              child: Text("Maps kedua"),
            ),
          ],
        ),
      ),
    );
  }
}