class Chapter {
  final int chapterId;
  final String name;
  final int subjectId;
  final bool isActive;

  const Chapter({
    required this.chapterId,
    required this.name,
    required this.isActive,
    required this.subjectId,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      chapterId: json['chapterId'],
      name: json['name'],
      isActive: json['isActive'],
      subjectId: json['subjectId'],
    );
  }
}
