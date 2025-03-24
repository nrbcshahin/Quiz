class Prize {
  int prizeId;
  String entityId;
  String name;
  double amount;

  Prize({
    required this.prizeId,
    required this.entityId,
    required this.name,
    required this.amount,
  });

  factory Prize.fromJson(Map<String, dynamic> json) {
    return Prize(
      prizeId: json['transactionId'],
      entityId: json['drCr'],
      name: json['amount'],
      amount: json['narration'],
    );
  }
}
