class Order {
  final String id;
  final String date;
  final String status;
  final String total;
  final String image;
  final String items;

  const Order({
    required this.id,
    required this.date,
    required this.status,
    required this.total,
    required this.image,
    required this.items,
  });
}
