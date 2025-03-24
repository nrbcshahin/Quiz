import 'package:flutter/material.dart';

import '../../helpers/colors.dart';
import '../models/param.dart';
import '../widgets/theme.widget.dart';
import 'quiz.view.dart';


class DailyChallengeView extends StatefulWidget {
  const DailyChallengeView({super.key});

  @override
  createState() => DailyChallengeViewState();
}

class DailyChallengeViewState extends State<DailyChallengeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ThemeWidget().appBar(context, const AppBarParam("Daily Challenge")),
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
                foregroundColor: primary,
                backgroundColor: Colors.white,
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
