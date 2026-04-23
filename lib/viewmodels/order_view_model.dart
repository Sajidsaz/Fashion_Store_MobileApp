import 'package:flutter/foundation.dart';
import '../models/order_model.dart';

class OrderViewModel extends ChangeNotifier {
  final List<Order> orders = const [
    Order(
      id:     '#ORD-1001',
      date:   '01 Mar 2026',
      status: 'Delivered',
      total:  'LKR 12,500',
      image:  'assets/images/p_img2_1.png',
      items:  'Men Cotton T-shirt, Trousers',
    ),
    Order(
      id:     '#ORD-1002',
      date:   '20 Feb 2026',
      status: 'Processing',
      total:  'LKR 4,500',
      image:  'assets/images/p_img7.png',
      items:  'Men Tapered Trousers',
    ),
    Order(
      id:     '#ORD-1003',
      date:   '10 Feb 2026',
      status: 'Cancelled',
      total:  'LKR 3,000',
      image:  'assets/images/p_img1.png',
      items:  'Women Cotton Top',
    ),
  ];
}
