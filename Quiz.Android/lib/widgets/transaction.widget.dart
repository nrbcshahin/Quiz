import 'package:flutter/material.dart';
import 'package:quiz/views/welcome.view.dart';

import '../models/transactions.dart';

class TransactionWidget {
  final icon = "0xe80d";

  Widget transactionThumb(context, Transaction transaction) => GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 7,
              ),
              Text(transaction.narration)
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

class IconFromCodeExample extends StatelessWidget {
  final int iconCode;

  const IconFromCodeExample({super.key, required this.iconCode});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        IconData(iconCode,
            fontFamily:
                'MaterialIcons'), // You can change 'MaterialIcons' to the appropriate font family
        size: 50.0,
        color: Colors.blue,
      ),
    );
  }
}
