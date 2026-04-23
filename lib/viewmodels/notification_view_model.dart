import 'package:flutter/foundation.dart';
import '../models/notification_model.dart';

class NotificationViewModel extends ChangeNotifier {
  bool _hasUnread = true;
  bool get hasUnread => _hasUnread;

  void markAllRead() {
    _hasUnread = false;
    notifyListeners();
  }

  final List<AppNotification> notifications = const [
    AppNotification(
      id:       '1',
      title:    'Order Shipped! 🚚',
      body:     'Your order #HS2024001 has been shipped. Expected delivery in 2–3 days.',
      type:     'order',
      time:     '2 min ago',
      iconType: 'shipping',
    ),
    AppNotification(
      id:       '2',
      title:    'Flash Sale — 30% Off! 🔥',
      body:     'Today only! Get 30% off on all summer collection. Use code SUMMER30.',
      type:     'promo',
      time:     '1 hr ago',
      iconType: 'offer',
    ),
    AppNotification(
      id:       '3',
      title:    'Order Delivered ✅',
      body:     'Your order #HS2024000 has been delivered. Enjoy your new outfit!',
      type:     'order',
      time:     '3 hrs ago',
      iconType: 'check',
    ),
    AppNotification(
      id:       '4',
      title:    'New Arrivals Just Dropped 👗',
      body:     'Check out our latest collection — new styles added every week!',
      type:     'promo',
      time:     'Yesterday',
      iconType: 'new',
    ),
    AppNotification(
      id:       '5',
      title:    'Order Confirmed 🎉',
      body:     'Your order #HS2023999 has been confirmed and is being processed.',
      type:     'order',
      time:     '2 days ago',
      iconType: 'receipt',
    ),
    AppNotification(
      id:       '6',
      title:    'Exclusive Members Deal 💎',
      body:     'As a valued customer, enjoy free shipping on your next 3 orders!',
      type:     'promo',
      time:     '3 days ago',
      iconType: 'gift',
    ),
  ];

  List<AppNotification> get orderNotifications =>
      notifications.where((n) => n.type == 'order').toList();

  List<AppNotification> get promoNotifications =>
      notifications.where((n) => n.type == 'promo').toList();
}
