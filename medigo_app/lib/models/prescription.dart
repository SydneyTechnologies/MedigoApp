// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Prescription PrescriptionFromJson(String str) =>
    Prescription.fromJson(json.decode(str));

String PrescriptionToJson(Prescription data) => json.encode(data.toJson());

class Prescription {
  Prescription({
    required this.id,
    required this.patientEmail,
    required this.prescriptionDate,
    required this.prescriptionList,
    required this.collected,
  });

  String id;
  String patientEmail;
  DateTime prescriptionDate;
  List<PrescriptionList> prescriptionList;
  bool collected;

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
        id: json["id"],
        patientEmail: json["patient_email"],
        prescriptionDate: DateTime.parse(json["prescription_date"]),
        prescriptionList: List<PrescriptionList>.from(
            json["prescription_list"].map((x) => PrescriptionList.fromJson(x))),
        collected: json["collected"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "patient_email": patientEmail,
        "prescription_date": prescriptionDate.toIso8601String(),
        "prescription_list":
            List<dynamic>.from(prescriptionList.map((x) => x.toJson())),
        "collected": collected,
      };
}

class PrescriptionList {
  PrescriptionList({
    required this.medicationName,
    required this.instructions,
    required this.issuer,
  });

  String medicationName;
  String instructions;
  String issuer;

  factory PrescriptionList.fromJson(Map<String, dynamic> json) =>
      PrescriptionList(
        medicationName: json["medication_name"],
        instructions: json["instructions"],
        issuer: json["issuer"],
      );

  Map<String, dynamic> toJson() => {
        "medication_name": medicationName,
        "instructions": instructions,
        "issuer": issuer,
      };
}
