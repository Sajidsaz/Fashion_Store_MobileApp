class Product {
  final String id;
  final String name;
  final double price;
  final String image;
  final List<String>? images;
  final String? category;
  final String? subCategory;
  final String? description;
  final List<String>? sizes;
  final bool bestseller;

  Product({
    this.id = '',
    required this.name,
    required this.price,
    required this.image,
    this.images,
    this.category,
    this.subCategory,
    this.description,
    this.sizes,
    this.bestseller = false,
  });
}