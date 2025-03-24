import 'package:flutter/material.dart';
import 'package:quiz/models/program.dart';

import '../helpers/colors.dart';
import '../views/subject_list.view.dart';

class ProgramWidget {
  Widget programThumb(context, Program program) => GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.favorite,
                size: 40.0,
                color: primary,
              ),
              const SizedBox(
                height: 7,
              ),
              Text(program.name)
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SubjectListView()),
          );
        },
      );
}
