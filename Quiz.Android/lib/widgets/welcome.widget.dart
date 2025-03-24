import 'package:flutter/material.dart';
import 'package:quiz/models/menu.dart';
import 'package:quiz/views/program_list.view.dart';

import '../helpers/colors.dart';

class WelcomeWidget {
  Widget buildMenu(List<Menu> menus) => Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: menus.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return _menuThumb(context, menus[index]);
          },
        ),
      );

  Widget _menuThumb(context, Menu menu) => GestureDetector(
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
              Text(menu.name)
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProgramListView()),
          );
        },
      );
}
