import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextWidget {
  Widget horizontalName(String name) => Container(
        height: 30,
        padding: const EdgeInsets.only(
          top: 7,
        ),
        child: Text(
          name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget verticalName(String name) => Container(
        height: 50,
        padding: const EdgeInsets.only(
          top: 3,
        ),
        child: Text(
          "লেখক : $name",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget horizontalUser(String name) => Container(
        padding: const EdgeInsets.only(
          bottom: 2,
        ),
        child: Text(
          name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
      );

  Widget verticalUser(String name) => Container(
        padding: const EdgeInsets.only(
          bottom: 2,
        ),
        child: Text(
          "লেখক : $name",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      );

  Widget verticalCategory(String name) => Container(
        padding: const EdgeInsets.only(
          bottom: 2,
        ),
        child: Text(
          "বিভাগ : $name",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
      );

  Widget price(double price) => Container(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          "মূল্য : ${price == 0 ? "ফ্রী" : NumberFormat.simpleCurrency(locale: 'bn').format(price)}",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.teal,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget bookCount(total) => Container(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          "${NumberFormat("###", "bn").format(total)} টি বই",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.teal,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget language(String language) => Container(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          "ভাষা : $language",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget sectionTitle(title) => Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 5,
          top: 7,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.view_list_rounded,
              size: 17,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      );
}
