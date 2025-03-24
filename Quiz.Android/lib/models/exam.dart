class Exam {
  final int examId;
  final String name;
  final String description;
  final bool isRandom;
  final DateTime startDate;
  final DateTime endDate;
  final int passScore;
  final bool isActive;

  const Exam({
    required this.examId,
    required this.name,
    required this.description,
    required this.isRandom,
    required this.startDate,
    required this.endDate,
    required this.passScore,
    required this.isActive,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      examId: json['examId'],
      name: json['name'],
      description: json['description'],
      isRandom: json['isRandom'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      passScore: json['passScore'],
      isActive: json['isActive'],
    );
  }
}
