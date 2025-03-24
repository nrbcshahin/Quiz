class Carousel {
  late int carouselId;
  late String title;
  late String image;
  late bool isActive;
  late int serialNo;

  Carousel({
    required this.carouselId,
    required this.title,
    required this.image,
    required this.isActive,
    required this.serialNo,
  });

  factory Carousel.fromJson(Map<String, dynamic> json) {
    return Carousel(
      carouselId: json["carouselId"],
      title: json["title"],
      image: json["image"],
      isActive: json["isActive"],
      serialNo: json["serialNo"],
    );
  }
}
