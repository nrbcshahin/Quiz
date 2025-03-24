import 'package:flutter/material.dart';
import 'package:quiz/helpers/colors.dart';
import 'package:quiz/views/menu_list.view.dart';

import '../models/menu.dart';

class MenuWidget {
  Widget menuThumb(context, Menu menu) => GestureDetector(
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
            MaterialPageRoute(builder: (context) => MenuListView(menu: menu)),
          );
        },
      );
}

class IconFromCodeExample extends StatelessWidget {
  final int iconCode;

  const IconFromCodeExample({super.key, required this.iconCode});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        IconData(iconCode, fontFamily: 'MaterialIcons'),
        size: 50.0,
        color: Colors.blue,
      ),
    );
  }
}
