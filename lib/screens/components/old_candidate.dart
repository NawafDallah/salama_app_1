import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salama_app/model/patient_model.dart';
import '../../model/old_candidate_model.dart';
import '../patient_report_page.dart';

class OldCandidate extends StatelessWidget {
  const OldCandidate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: oldCandidate.length,
        itemBuilder: (context, index) {
          return Card(
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(23))),
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
                    oldCandidate[index].name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text("Gender: ${oldCandidate[index].gender}"),
                  Text("Age: ${oldCandidate[index].age}"),
                  const SizedBox(height: 16),
                  const Text("Symptoms:"),
                  Text(oldCandidate[index].symptoms),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      // Handle location click action
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => ReportPage(
                                age: person[index].age,
                                assignedName: person[index].assignedName,
                                latitude: person[index].latitude,
                                messionReport: person[index].messionReport,
                                messionDuration: person[index].messionDuration,
                                name: person[index].name,
                                messionResult: person[index].messionResult,
                                symptoms: person[index].symptoms,
                                longitude: person[index].longitude,
                                gender: person[index].gender,
                              )));
                    },
                    child: const Text(
                      'click to see report',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
