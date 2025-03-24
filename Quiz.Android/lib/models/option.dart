
class Option {
  final int optionId;
  final String title;
  final bool isActive;
  final bool isCorrect;

  const Option({
    required this.optionId,
    required this.title,
    required this.isActive,
    required this.isCorrect,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      optionId: json['optionId'],
      title: json['title'],
      isActive: json['isActive'],
      isCorrect: json['isCorrect'],
    );
  }
}
