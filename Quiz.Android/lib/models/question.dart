import 'package:quiz/models/option.dart';

class Question {
  final int questionId;
  final String title;
  final bool isActive;
  final List<Option> options;
  final Option? selected;

  const Question({
    required this.questionId,
    required this.title,
    required this.isActive,
    required this.options,
    this.selected,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionId: json['questionId'],
      title: json['title'],
      isActive: json['isActive'],
      options:
          (json["options"] as List).map((x) => Option.fromJson(x)).toList(),
    );
  }
}
