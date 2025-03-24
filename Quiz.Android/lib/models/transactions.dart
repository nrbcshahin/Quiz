class Transaction {
  int transactionId;
  String drCr;
  double amount;
  String narration;
  int userId;
  String txnDate;

  Transaction({
    required this.transactionId,
    required this.drCr,
    required this.amount,
    required this.narration,
    required this.userId,
    required this.txnDate,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      transactionId: json['transactionId'],
      drCr: json['drCr'],
      amount: json['amount'],
      narration: json['narration'],
      userId: json['userId'],
      txnDate: json['txnDate'],
    );
  }
}
