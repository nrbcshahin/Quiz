import 'package:flutter/material.dart';
import 'package:quiz/helpers/colors.dart';

import '../helpers/api.helper.dart';
import '../models/option.dart';
import '../models/question.dart';
import '../widgets/theme.widget.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  createState() => QuizViewState();
}

class QuizViewState extends State<QuizView> {
  final controller = PageController(initialPage: 0);
  late List<Question> _questionList = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      pullData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeWidget().appBar(context, "Quiz"),
      body: loading
          ? ThemeWidget().progress()
          : Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: controller,
                      scrollDirection: Axis.vertical,
                      itemCount: _questionList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return buildQuestion(_questionList[index], index + 1);
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildQuestion(Question question, index) {
    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            "QUESTION $index/${_questionList.length}",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 550,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView(
            children: [
              Text(
                question.title.trim(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  return buildOption(question.options[index], index);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  controller.animateToPage(
                    index,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildOption(Option option, index) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          alignment: Alignment.centerLeft,
          side: const BorderSide(
            width: 1,
            color: Colors.black12,
          ),
          padding: const EdgeInsets.only(
            left: 20,
            top: 15,
            right: 20,
            bottom: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          if (option.isCorrect) {
            setState(() {});
          } else {
            setState(() {});
          }
        },
        child: Text(
          "${index + 1} : ${option.title.trim()}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  pullData() async {
    final req = {"menuId": 5};
    final response = await Api().post("question/question-list", req);
    if (!response.success) {
      setState(() {
        loading = false;
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(response.message),
        ),
      );
    } else {
      setState(() {
        loading = false;
        _questionList = (response.data["questions"] as List)
            .map((x) => Question.fromJson(x))
            .toList();
      });
    }
  }
}

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final bool isCorrect;
  final bool isDisplayingAnswer;
  final VoidCallback onTap;

  const AnswerCard({
    required Key key,
    required this.answer,
    required this.isSelected,
    required this.isCorrect,
    required this.isDisplayingAnswer,
    required this.onTap,
  }) : super(key: key);

  final List<BoxShadow> boxShadow = const [
    BoxShadow(
      color: Colors.black26,
      offset: Offset(0, 2),
      blurRadius: 4.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 20.0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: boxShadow,
          border: Border.all(
            color: isDisplayingAnswer
                ? isCorrect
                    ? Colors.green
                    : isSelected
                        ? Colors.red
                        : Colors.white
                : Colors.white,
            width: 4.0,
          ),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                "aaaaaaaaaaaaaaa",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: isDisplayingAnswer && isCorrect
                      ? FontWeight.bold
                      : FontWeight.w400,
                ),
              ),
            ),
            if (isDisplayingAnswer)
              isCorrect
                  ? const CircularIcon(
                      icon: Icons.check,
                      color: Colors.green,
                      key: null,
                    )
                  : isSelected
                      ? const CircularIcon(
                          icon: Icons.close,
                          color: Colors.red,
                          key: null,
                        )
                      : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

class CircularIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const CircularIcon({
    key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final List<BoxShadow> boxShadow = const [
    BoxShadow(
      color: Colors.black26,
      offset: Offset(0, 2),
      blurRadius: 4.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.0,
      width: 24.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: boxShadow,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 16.0,
      ),
    );
  }
}
