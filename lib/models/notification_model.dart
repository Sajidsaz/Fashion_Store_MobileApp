class AppNotification {
  final String id;
  final String title;
  final String body;
  final String type;     // 'order' | 'promo'
  final String time;
  final String iconType; // 'shipping' | 'offer' | 'check' | 'new' | 'receipt' | 'gift'

  const AppNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.time,
    required this.iconType,
  });
}
