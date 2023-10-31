import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salama_app/entry_point.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import '../constant.dart';
import 'components/time_line_tile.dart';

class MessionPage extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String name;
  final int index;
  const MessionPage(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.name,
      required this.index});

  @override
  State<MessionPage> createState() => _MessionPageState();
}

class _MessionPageState extends State<MessionPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 211, 175, 65),
          foregroundColor: backgroundColorDark,
          onPressed: () {
            if (index != 5) {
              setState(() {
                index++;
              });
            }
            if (index == 5) {
              Navigator.of(context).pushReplacement(CupertinoPageRoute(
                  builder: (context) => const EntryPoint()));
            }
          },
          child: index == 4 || index == 5
              ? const Icon(CupertinoIcons.arrow_up_right)
              : const Icon(CupertinoIcons.checkmark_circle_fill)),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 211, 175, 65),
          foregroundColor: backgroundColorDark,
          centerTitle: true,
          leading: const SizedBox(),
          title: const Text(
            "Track Missions", 
            style: TextStyle(fontFamily: 'Poppins'),
          )),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            child: SfMaps(
              layers: [
                MapTileLayer(
                  initialFocalLatLng:
                      MapLatLng(widget.latitude, widget.longitude),
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  initialMarkersCount: 1,
                  initialZoomLevel: 13,
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
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const TimeLineTile11(
                    isFirst: true,
                    isPast: true,
                    isLast: false,
                    eventCardChild: Text(
                      'receipt',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                  ),
                  const TimeLineTile11(
                    isFirst: false,
                    isPast: true,
                    isLast: false,
                    eventCardChild: Text('acceptance',
                        style: TextStyle(fontFamily: 'Poppins')),
                  ),
                  TimeLineTile11(
                    isFirst: false,
                    isPast: index >= 1,
                    isLast: false,
                    eventCardChild: const Text('movement',
                        style: TextStyle(fontFamily: 'Poppins')),
                  ),
                  TimeLineTile11(
                    isFirst: false,
                    isPast: index >= 2,
                    isLast: false,
                    eventCardChild: const Text('site arrival',
                        style: TextStyle(fontFamily: 'Poppins')),
                  ),
                  TimeLineTile11(
                    isFirst: false,
                    isPast: index >= 3,
                    isLast: false,
                    eventCardChild: const Text('direct case',
                        style: TextStyle(fontFamily: 'Poppins')),
                  ),
                  TimeLineTile11(
                    isFirst: false,
                    isPast: index >= 4,
                    isLast: true,
                    eventCardChild: const Text('delivery case',
                        style: TextStyle(fontFamily: 'Poppins')),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
