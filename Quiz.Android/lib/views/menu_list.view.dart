import 'package:flutter/material.dart';
import '../../helpers/api.helper.dart';

import '../models/menu.dart';
import '../widgets/drawer.widget.dart';
import '../widgets/menu.widget.dart';
import '../widgets/theme.widget.dart';

class MenuListView extends StatefulWidget {
  final Menu menu;
  const MenuListView({super.key, required this.menu});

  @override
  createState() => _MenuListViewState();
}

class _MenuListViewState extends State<MenuListView> {
  bool isLoading = true;
  List<Menu> _menuList = [];
  late Menu menu;

  @override
  void initState() {
    super.initState();
    menu = widget.menu;
    pullData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ThemeWidget().appBar(context, menu.name),
      drawer: getDrawer(context),
      body: isLoading
          ? ThemeWidget().progress()
          : Container(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: _menuList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return MenuWidget().menuThumb(context, _menuList[index]);
                },
              ),
            ),
    );
  }

  pullData() async {
    final req = {"parentId": menu.menuId};
    final response = await Api().post("menu/menu-list", req);
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
        _menuList = (response.data["menus"] as List)
            .map((x) => Menu.fromJson(x))
            .toList();
      });
    }
  }
}
