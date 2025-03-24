import 'package:flutter/material.dart';
import 'package:quiz/views/quiz.view.dart';

import '../helpers/colors.dart';
import '../widgets/theme.widget.dart';

class BuddyChallengeView extends StatefulWidget {
  const BuddyChallengeView({super.key});

  @override
  createState() => BuddyChallengeViewState();
}

class BuddyChallengeViewState extends State<BuddyChallengeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ThemeWidget().appBar(context, "Buddy Challenge"),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You have completed 2 challenge"),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: primary,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizView()),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.near_me),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "CONTINUE",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
