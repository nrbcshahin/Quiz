import 'package:flutter/material.dart';

import '../../helpers/constants.dart';
import '../models/user.dart';
import '../views/welcome.view.dart';
import 'text.widget.dart';
import 'theme.widget.dart';

class UserWidget {
  Widget buildUserList(context, title, user) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget().sectionTitle(title),
          SizedBox(
            height: 200,
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              itemCount: user.length,
              itemBuilder: (context, index) {
                return _horizontalCard(context, user[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 15,
                );
              },
            ),
          ),
        ],
      );

  Widget _horizontalCard(context, User user) => GestureDetector(
        child: SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getImage(user),
              TextWidget().horizontalName(user.name),
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

  Widget gridWriterList(context, List<User> users) => GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        childAspectRatio: 10 / 19,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 10,
        children: users.map((user) {
          return _gridCard(context, user);
        }).toList(),
      );

  Widget _gridCard(context, User user) => GestureDetector(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getImage(user),
              TextWidget().horizontalName(user.name),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WelcomeView()));
        },
      );

  Widget getImage(user) => Expanded(
        child: AspectRatio(
          aspectRatio: 4 / 5,
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(7)),
              child:
                  ThemeWidget().networkImage("${imageUrl}users/" + user.image)),
        ),
      );
}
