class Auth {
  final String token;
  final String signature;

  const Auth({required this.token, required this.signature});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      token: json['token'],
      signature: json['signature'],
    );
  }
}
