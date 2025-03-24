class UserPrize {
  int upId;
  int entityId;
  int prizeId;
  int userId;

  UserPrize({
    required this.upId,
    required this.entityId,
    required this.prizeId,
    required this.userId,
  });

  factory UserPrize.fromJson(Map<String, dynamic> json) {
    return UserPrize(
      upId: json['upId'],
      entityId: json['entityId'],
      prizeId: json['prizeId'],
      userId: json['userId'],
    );
  }
}
