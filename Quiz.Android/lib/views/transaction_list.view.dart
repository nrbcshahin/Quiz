import 'package:flutter/material.dart';
import '../helpers/api.helper.dart';

import '../models/transactions.dart';
import '../widgets/transaction.widget.dart';
import '../widgets/drawer.widget.dart';
import '../widgets/theme.widget.dart';

class TransactionListView extends StatefulWidget {
  const TransactionListView({super.key});

  @override
  createState() => _TransactionListViewState();
}

class _TransactionListViewState extends State<TransactionListView> {
  bool isLoading = true;
  List<Transaction> _transactionList = [];

  @override
  void initState() {
    super.initState();
    pullData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ThemeWidget().appBar(context, "লেনদেন বিবরণী"),
      drawer: getDrawer(context),
      body: isLoading
          ? ThemeWidget().progress()
          : Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: _transactionList.length,
                itemBuilder: (context, index) {
                  return TransactionWidget()
                      .transactionThumb(context, _transactionList[index]);
                },
              )),
    );
  }

  pullData() async {
    final req = {"userId": 1};
    final response = await Api().post("app/transaction/transaction-list", req);
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
        _transactionList = (response.data["transactions"] as List)
            .map((x) => Transaction.fromJson(x))
            .toList();
      });
    }
  }
}
