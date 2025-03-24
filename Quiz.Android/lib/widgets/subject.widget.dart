import 'package:flutter/material.dart';

import '../helpers/colors.dart';
import '../models/subject.dart';
import '../views/welcome.view.dart';

class SubjectWidget {
  Widget subjectThumb(context, Subject subject) => GestureDetector(
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
              Text(subject.name)
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WelcomeView()),
          );
        },
      );
}
