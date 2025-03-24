import 'package:flutter/material.dart';

import '../views/welcome.view.dart';

Widget getDrawer(context) => SizedBox(
      width: 260,
      child: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(""),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                size: 17,
                color: Colors.black54,
              ),
              title: const Text(
                "হোম",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              dense: true,
              minLeadingWidth: 10,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomeView()),
                );
              },
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(
                Icons.menu_book_rounded,
                size: 18,
                color: Colors.black54,
              ),
              dense: true,
              minLeadingWidth: 10,
              title: const Text(
                "বই সমূহ",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeView(),
                  ),
                );
              },
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            ),
            ListTile(
              leading: const Icon(
                Icons.person_sharp,
                size: 18,
                color: Colors.black54,
              ),
              dense: true,
              minLeadingWidth: 10,
              title: const Text(
                "লেখক সমূহ",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomeView()),
                );
              },
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            ),
            ListTile(
              leading: const Icon(
                Icons.local_library,
                size: 17,
                color: Colors.black54,
              ),
              dense: true,
              minLeadingWidth: 10,
              title: const Text(
                "আমার লাইব্রেরি",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomeView()),
                );
              },
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(
                Icons.category,
                size: 17,
                color: Colors.black54,
              ),
              dense: true,
              minLeadingWidth: 10,
              title: const Text(
                "বিভাগ সমূহ",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomeView()),
                );
              },
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            ),
            ListTile(
              leading: const Icon(
                Icons.map,
                size: 17,
                color: Colors.black54,
              ),
              dense: true,
              minLeadingWidth: 10,
              title: const Text(
                "প্রকাশনী সমূহ",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomeView()),
                );
              },
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            ),
            ListTile(
              leading: const Icon(
                Icons.language,
                size: 17,
                color: Colors.black54,
              ),
              dense: true,
              minLeadingWidth: 10,
              title: const Text(
                "ভাষা সমূহ",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomeView()),
                );
              },
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(
                Icons.wallet_membership,
                size: 17,
                color: Colors.black54,
              ),
              dense: true,
              minLeadingWidth: 10,
              title: const Text(
                "ওয়ালেট",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomeView()),
                );
              },
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                size: 18,
                color: Colors.black54,
              ),
              dense: true,
              minLeadingWidth: 10,
              title: const Text(
                "সেটিংস",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomeView()),
                );
              },
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                size: 19,
                color: Colors.black54,
              ),
              dense: true,
              minLeadingWidth: 10,
              title: const Text(
                "লগ ইন",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomeView()),
                );
              },
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            )
          ],
        ),
      ),
    );
