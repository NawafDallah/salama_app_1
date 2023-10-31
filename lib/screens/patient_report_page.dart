import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salama_app/screens/report_Location_page.dart';

import '../constant.dart';

class ReportPage extends StatelessWidget {
  final String name;
  final String gender;
  final int age;
  final String symptoms;
  final double longitude;
  final double latitude;
  final String messionReport;
  final String messionDuration;
  final String messionResult;
  final String assignedName;

  const ReportPage(
      {super.key,
      required this.name,
      required this.gender,
      required this.age,
      required this.symptoms,
      required this.longitude,
      required this.latitude,
      required this.messionReport,
      required this.messionDuration,
      required this.messionResult,
      required this.assignedName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 211, 175, 65),
        foregroundColor: backgroundColorDark,
        centerTitle: true,
        title: const Text(
          "Report",
          style: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      body: SizedBox(
          width: double.infinity,
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(23), left: Radius.circular(23))),
            color: const Color.fromARGB(255, 211, 175, 65),
            elevation: 5,
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mission Report: $messionReport',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  const SizedBox(height: 36),
                  Text(
                    "Mission Result: $messionResult",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  const SizedBox(height: 36),
                  const Text(
                    'Patient Information: ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  Text("• Name: $name"),
                  Text("• Gender: $gender"),
                  Text("• Age: $age"),
                  const SizedBox(height: 46),
                  const Text(
                    "Symptoms Reported:",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  Text('• $symptoms'),
                  const SizedBox(height: 36),
                  const Text(
                    "Mission Details:",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  Text('• Duration $messionDuration'),
                  const SizedBox(height: 36),
                  const Text(
                    "Assigned Responder:",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  Text('• Name $assignedName'),
                  const SizedBox(height: 36),
                  GestureDetector(
                    onTap: () {
                      // Handle location click action
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => ReportLocation(
                                latitude: latitude,
                                longitude: longitude,
                                name: name,
                              )));
                    },
                    child: const Text(
                      'For the location details of the mission, click here',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
