import 'package:flutter/material.dart';
import 'package:quiz/widgets/program.widget.dart';
import '../../helpers/api.helper.dart';

import '../models/program.dart';
import '../widgets/drawer.widget.dart';
import '../widgets/theme.widget.dart';

class ProgramListView extends StatefulWidget {
  const ProgramListView({super.key});

  @override
  createState() => _ProgramListViewState();
}

class _ProgramListViewState extends State<ProgramListView> {
  bool isLoading = true;
  List<Program> _programList = [];

  @override
  void initState() {
    super.initState();
    pullData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ThemeWidget().appBar(context, ""),
      drawer: getDrawer(context),
      body: isLoading
          ? ThemeWidget().progress()
          : Container(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: _programList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return ProgramWidget()
                      .programThumb(context, _programList[index]);
                },
              ),
            ),
    );
  }

  pullData() async {
    final response = await Api().post("program/program-list", {});
    if (!response.success) {
      isLoading = false;
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(response.message),
        ),
      );
    } else {
      isLoading = false;
      setState(() {
        _programList = (response.data["programs"] as List)
            .map((x) => Program.fromJson(x))
            .toList();
      });
    }
  }
}
