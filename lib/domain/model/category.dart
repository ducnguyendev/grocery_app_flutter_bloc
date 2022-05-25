class Category {
  Category({
    required this.id,
    required this.user,
    required this.imageSrc,
    required this.imageAlt,
  });

  final String? id;
  final String? user;
  final String? imageSrc;
  final String? imageAlt;

  Category copyWith({
    required String id,
    required String user,
    required String imageSrc,
    required String imageAlt,
  }) =>
      Category(
        id: this.id,
        user: this.user,
        imageSrc: this.imageSrc,
        imageAlt: this.imageAlt,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    user: json["user"],
    imageSrc: json["imageSrc"],
    imageAlt: json["imageAlt"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "imageSrc": imageSrc,
    "imageAlt": imageAlt
  };
}
