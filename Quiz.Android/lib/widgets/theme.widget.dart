import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quiz/views/welcome.view.dart';

import '../helpers/colors.dart';

class ThemeWidget {
  Widget progress() => Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white10,
        ),
        child: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(primary),
              strokeWidth: 3,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Loading ...",
              style: TextStyle(
                color: primary,
                fontSize: 14,
              ),
            ),
          ],
        )),
      );

  AppBar appBar(context, title) => AppBar(
        title: Text(title),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            visualDensity: const VisualDensity(
              horizontal: -4.0,
              vertical: -4.0,
            ),
            icon: const Icon(
              Icons.search,
              color: primary,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeView()),
              );
            },
          ),
          IconButton(
            visualDensity: const VisualDensity(
              horizontal: -4.0,
              vertical: -4.0,
            ),
            icon: const Icon(
              Icons.add_shopping_cart,
              color: primary,
              size: 21,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeView()),
              );
            },
          ),
          PopupMenuButton<int>(
            color: primary,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 0,
                child: Text("Settings"),
              ),
            ],
            onSelected: (item) => onSelected(context, item),
          ),
        ],
      );

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        // print("sss");
        break;

      case 1:
        //  print("sss");
        break;

      case 2:
        //   print("sss");
        break;
    }
  }

  InputDecoration textField(String label, icon) => InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        prefixIcon: Icon(
          icon,
          color: primary,
        ),
        filled: true,
        labelStyle: const TextStyle(
          color: primary,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 1.7, color: primary),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 1.2, color: primary),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 1.2, color: primary),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 1.2, color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 1.2, color: Colors.red),
        ),
        labelText: label,
        fillColor: Colors.white70,
        counterText: "",
        errorStyle: TextStyle(
          color: Colors.red[400],
          fontSize: 13,
        ),
      );

  ButtonStyle buttonStyle() => ElevatedButton.styleFrom(
        backgroundColor: primary,
        minimumSize: const Size.fromHeight(50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      );

  Widget networkImage(url) => CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
              colorFilter: const ColorFilter.mode(
                Colors.transparent,
                BlendMode.colorBurn,
              ),
            ),
          ),
        ),
        placeholder: (context, url) => Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.width / 10,
            width: MediaQuery.of(context).size.width / 10,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black12),
              strokeWidth: 4,
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          size: 50,
        ),
      );
}
