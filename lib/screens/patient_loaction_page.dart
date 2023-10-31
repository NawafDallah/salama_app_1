import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salama_app/entry_point.dart';
import 'package:salama_app/model/old_candidate_model.dart';
import 'package:salama_app/model/patient_model.dart';
import 'package:salama_app/screens/mession_page.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class PatientLocationPage extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String name;
  final int index;
  const PatientLocationPage(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.name,
      required this.index});

  @override
  State<PatientLocationPage> createState() => _PatientLocationPageState();
}

class _PatientLocationPageState extends State<PatientLocationPage> {
  late List<Model> _data;

  late MapZoomPanBehavior _mapZoomPanBehavior;

  @override
  void initState() {
    _data = <Model>[
      Model(widget.latitude, widget.longitude),
    ];
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
    return Scaffold(
      body: Stack(children: [
        Positioned(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SfMaps(
              layers: [
                MapTileLayer(
                  initialFocalLatLng:
                      MapLatLng(widget.latitude, widget.longitude),
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  zoomPanBehavior: _mapZoomPanBehavior,
                  initialMarkersCount: 1,
                  markerBuilder: (BuildContext context, int index) {
                    return MapMarker(
                      latitude: _data[index].latitude,
                      longitude: _data[index].longitude,
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
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
              height: 100,
              decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        person.remove(person[widget.index]);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const EntryPoint()));
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 40),
                        backgroundColor: Colors.redAccent,
                      ),
                      child: const Text('reject',
                          style: TextStyle(fontFamily: 'Poppins'))),
                  ElevatedButton(
                      onPressed: () {
                        oldCandidate.add(person[widget.index]);
                        person.remove(person[widget.index]);
                        Navigator.of(context).pushReplacement(
                            CupertinoPageRoute(
                                builder: (context) => MessionPage(
                                    latitude: widget.latitude,
                                    longitude: widget.longitude,
                                    name: widget.name,
                                    index: widget.index)));
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 40),
                        backgroundColor:
                            const Color.fromARGB(255, 211, 175, 65),
                      ),
                      child: const Text(
                        'Accept',
                        style: TextStyle(fontFamily: 'Poppins'),
                      )),
                ],
              )),
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
                      '${widget.name}`s location',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
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
      ]),
    );
  }
}

class Model {
  const Model(this.latitude, this.longitude);

  final double latitude;
  final double longitude;
}
