import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class QuizResultView extends StatefulWidget {
  const QuizResultView({super.key});

  @override
  createState() => QuizResultViewState();
}

class QuizResultViewState extends State<QuizResultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _pieChartBox(),
        ],
      ),
    );
  }

  Widget _pieChartBox() => Container(
        margin: const EdgeInsets.all(20),
        child: SizedBox(
          height: 320,
          width: double.infinity,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 80,
              centerSpaceColor: Colors.white,
              borderData: FlBorderData(show: false),
              sections: [
                PieChartSectionData(value: 3, color: Colors.red),
                PieChartSectionData(value: 8, color: Colors.green),
              ],
            ),
          ),
        ),
      );
}
