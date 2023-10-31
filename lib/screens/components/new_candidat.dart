import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/patient_model.dart';
import '../patient_loaction_page.dart';

class NewCandidate extends StatefulWidget {
  const NewCandidate({
    super.key,
  });

  @override
  State<NewCandidate> createState() => _NewCandidateState();
}

class _NewCandidateState extends State<NewCandidate> {
  @override
  void initState() {
    setState(() {
      
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: person.length,
        itemBuilder: (context, index) {
          return Card(
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(23))),
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
                    person[index].name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text("Gender: ${person[index].gender}"),
                  Text("Age: ${person[index].age}"),
                  const SizedBox(height: 16),
                  const Text("Symptoms:"),
                  Text(person[index].symptoms),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      // Handle location click action
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => PatientLocationPage(
                                index: index,
                                name: person[index].name,
                                latitude: person[index].latitude,
                                longitude: person[index].longitude,
                              )));
                    },
                    child: const Text(
                      'click to see location',
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
