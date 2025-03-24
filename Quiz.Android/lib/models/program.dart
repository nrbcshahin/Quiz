class Program {
  final int programId;
  final String name;
  final bool isActive;

  const Program({
    required this.programId,
    required this.name,
    required this.isActive,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      programId: json['programId'],
      name: json['name'],
      isActive: json['isActive'],
    );
  }
}
