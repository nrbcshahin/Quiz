class Subject {
  final int subjectId;
  final String name;
  final String? part;
  final String code;
  final bool isActive;
  final int programId;

  const Subject({
    required this.subjectId,
    required this.name,
    this.part,
    required this.code,
    required this.isActive,
    required this.programId,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      subjectId: json['subjectId'],
      name: json['name'],
      part: json['part'],
      code: json['code'],
      isActive: json['isActive'],
      programId: json['programId'],
    );
  }
}
