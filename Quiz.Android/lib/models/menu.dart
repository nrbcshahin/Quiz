class Menu {
  final int menuId;
  final String name;
  final String image;
  final bool isActive;

  const Menu({
    required this.menuId,
    required this.name,
    required this.image,
    required this.isActive,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      menuId: json['menuId'],
      name: json['name'],
      image: json['image'],
      isActive: json['isActive'],
    );
  }
}
