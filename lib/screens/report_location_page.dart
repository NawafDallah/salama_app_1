import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class ReportLocation extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String name;
  const ReportLocation(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.name});

  @override
  State<ReportLocation> createState() => _ReportLocationState();
}

class _ReportLocationState extends State<ReportLocation> {
  late MapZoomPanBehavior _mapZoomPanBehavior;

  @override
  void initState() {
    _mapZoomPanBehavior = MapZoomPanBehavior(
      zoomLevel: 13,
      enableDoubleTapZooming: true,
      enableMouseWheelZooming: true,
      minZoomLevel: 5,
      maxZoomLevel: 15,
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
                initialFocalLatLng: MapLatLng(widget.latitude, widget.longitude),
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                zoomPanBehavior: _mapZoomPanBehavior,
                initialMarkersCount: 1,
                markerBuilder: (BuildContext context, int index) {
                  return MapMarker(
                    latitude: widget.latitude,
                    longitude: widget.longitude,
                    child: const Icon(
                      CupertinoIcons.location_solid,
                      color: Colors.redAccent,
                      size: 30,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Positioned(
          left: 15,
          right: 15,
          top: 60,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    foregroundColor: Color.fromARGB(255, 211, 175, 65),
                    backgroundColor: Colors.black54,
                    child: Icon(CupertinoIcons.arrow_left),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 6.0),
                    height: 40,
                    decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      '${widget.name}`s location ',
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                          fontSize: 16,
                          color: Color.fromARGB(255, 211, 175, 65),
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
