class Medication {
  String name;
  int dosage;
  String instructions;
  DateTime startDate;
  DateTime endDate;

  Medication({
    required this.name,
    required this.dosage,
    required this.instructions,
    required this.startDate,
    required this.endDate,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      name: json['name'],
      dosage: json['dosage'],
      instructions: json['instructions'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'dosage': dosage,
        'instructions': instructions,
        'start_date': startDate.toIso8601String(),
        'end_date': endDate.toIso8601String(),
      };
}
