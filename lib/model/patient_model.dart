import 'old_candidate_model.dart';

class Person extends OldPatientCandidate {
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

  Person({
    required this.latitude,
    required this.messionReport,
    required this.messionDuration,
    required this.messionResult,
    required this.assignedName,
    required this.name,
    required this.gender,
    required this.age,
    required this.symptoms,
    required this.longitude,
  }) : super(name: '', gender: '', age: 0, symptoms: '');
}

final List<Person> person = [
  Person(
      name: "Ahmad Khalid",
      gender: "Male",
      age: 25,
      symptoms: "Shortness of breath with spasms in the body",
      longitude: 46.738586,
      latitude: 24.774265,
      assignedName: 'khalid abdallah',
      messionDuration: '30 minutes',
      messionReport: '#153587',
      messionResult: 'Success'),
  Person(
      name: "nawaf saad",
      gender: "Male",
      age: 20,
      symptoms: "Shortness of breath with spasms in the body",
      longitude: 46.650761,
      latitude: 24.717832,
      assignedName: 'salma hasan',
      messionDuration: '45 minutes',
      messionReport: '#234587',
      messionResult: 'Success'),
  Person(
      name: "rinad ali",
      gender: "Female",
      age: 22,
      symptoms: "Shortness of breath with spasms in the body",
      longitude: 46.590905,
      latitude: 24.832605,
      assignedName: 'roaa naser',
      messionDuration: '55 minutes',
      messionReport: '#458124',
      messionResult: 'Success'),
      Person(
      name: "Maha mohammed",
      gender: "Female",
      age: 32,
      symptoms: "Shortness of breath with spasms in the body",
      longitude: 46.590905,
      latitude: 24.772605,
      assignedName: 'roaa naser',
      messionDuration: '20 minutes',
      messionReport: '#333124',
      messionResult: 'Success'),
];
