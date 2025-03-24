import 'package:flutter/material.dart';

import '../models/param.dart';
import '../widgets/theme.widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeWidget().appBar(context, const AppBarParam("Dashboard")),
      drawer: ThemeWidget().appBar(context, ""),
      body: _buildBody(),
    );
  }

  Widget _buildBody() => Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: GridView.count(
          crossAxisCount: 1,
          children: const <Widget>[
            //     _pieChartBox(),
            //    _lineChartBox(),
          ],
        ),
      );

/*
  Widget _lineChartBox() => Container(
        margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: primary, width: 1),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset.zero,
              blurRadius: 10.0,
              spreadRadius: 0.0,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: primary,
                border: Border(
                  bottom: BorderSide(
                    color: primary,
                  ),
                ),
              ),
              child: const Text(
                "DAILY COLLECTION",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              height: 290,
              width: double.infinity,
              child: LineChart(
                LineChartData(
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 1),
                        const FlSpot(1, 3),
                        const FlSpot(2, 10),
                        const FlSpot(3, 7),
                        const FlSpot(4, 12),
                        const FlSpot(5, 13),
                        const FlSpot(6, 17),
                        const FlSpot(7, 15),
                        const FlSpot(8, 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _pieChartBox() => Container(
        margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: primary, width: 1),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset.zero,
              blurRadius: 10.0,
              spreadRadius: 0.0,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: primary,
                border: Border(
                  bottom: BorderSide(
                    color: primary,
                  ),
                ),
              ),
              child: const Text(
                "COLLECTION SUMMARY",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 320,
              width: double.infinity,
              child: PieChart(PieChartData(
                  centerSpaceRadius: 90,
                  centerSpaceColor: Colors.yellow,
                  borderData: FlBorderData(show: false),
                  sections: [
                    PieChartSectionData(value: 10, color: Colors.blue),
                    PieChartSectionData(value: 10, color: Colors.orange),
                    PieChartSectionData(value: 10, color: Colors.red),
                    PieChartSectionData(value: 10, color: Colors.purple),
                    PieChartSectionData(value: 20, color: Colors.amber),
                    PieChartSectionData(value: 30, color: Colors.green)
                  ])),
            ),
          ],
        ),
      );
      */
}
