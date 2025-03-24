import 'package:flutter/material.dart';
import '../../helpers/api.helper.dart';

import '../models/subject.dart';
import '../widgets/drawer.widget.dart';
import '../widgets/subject.widget.dart';
import '../widgets/theme.widget.dart';

class SubjectListView extends StatefulWidget {
  const SubjectListView({super.key});

  @override
  createState() => _SubjectListViewState();
}

class _SubjectListViewState extends State<SubjectListView> {
  bool isLoading = true;
  List<Subject> _subjectList = [];

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
      body: isLoading
          ? ThemeWidget().progress()
          : Container(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: _subjectList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return SubjectWidget()
                      .subjectThumb(context, _subjectList[index]);
                },
              ),
            ),
    );
  }

  pullData() async {
    final response = await Api().post("subject/subject-list", {});
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
        _subjectList = (response.data["subjects"] as List)
            .map((x) => Subject.fromJson(x))
            .toList();
      });
    }
  }
}
