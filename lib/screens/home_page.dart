import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import 'on_boarding_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MapZoomPanBehavior _mapZoomPanBehavior;

  @override
  void initState() {
    _mapZoomPanBehavior = MapZoomPanBehavior(
      zoomLevel: 12,
      enableDoubleTapZooming: true,
      enableMouseWheelZooming: true,
      minZoomLevel: 5,
      maxZoomLevel: 15,
      focalLatLng: const MapLatLng(24.774265, 46.738586),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: SfMaps(
            layers: [
              MapTileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                zoomPanBehavior: _mapZoomPanBehavior,
              ),
            ],
          ),
        ),
        Positioned(
          top: 70,
          right: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const OnboardingScreen()));
            },
            child: const CircleAvatar(
              foregroundColor: Colors.red,
              backgroundColor: Colors.black87,
              child: Center(child: Icon(Icons.logout)),
            ),
          ),
        )
      ],
    );
  }
}

class Model {
  const Model(this.country, this.latitude, this.longitude);

  final String country;
  final double latitude;
  final double longitude;
}
