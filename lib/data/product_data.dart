import '../models/product_model.dart';

const String _img = 'assets/images';

final List<Product> allProducts = [
  Product(
    id: 'aaaaa', name: 'Women Round Neck Cotton Top', price: 3000,
    image: '$_img/p_img1.png', category: 'Women', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L'], bestseller: true,
    description: 'A lightweight, usually knitted, pullover top, close-fitting and with a round neckline and short sleeves. Perfect for everyday wear.',
  ),
  Product(
    id: 'aaaab', name: 'Men Round Neck Pure Cotton T-shirt', price: 6000,
    image: '$_img/p_img2_1.png',
    images: ['$_img/p_img2_1.png', '$_img/p_img2_2.png', '$_img/p_img2_3.png', '$_img/p_img2_4.png'],
    category: 'Men', subCategory: 'Topwear',
    sizes: ['M', 'L', 'XL'], bestseller: true,
    description: 'A lightweight, pure cotton T-shirt with a round neckline. Comfortable and breathable for all-day wear.',
  ),
  Product(
    id: 'aaaac', name: 'Girls Round Neck Cotton Top', price: 6600,
    image: '$_img/p_img3.png', category: 'Kids', subCategory: 'Topwear',
    sizes: ['S', 'L', 'XL'], bestseller: true,
    description: 'A cute and comfortable cotton top for girls. Round neckline with short sleeves, ideal for casual outings.',
  ),
  Product(
    id: 'aaaad', name: 'Men Round Neck Pure Cotton T-shirt', price: 3300,
    image: '$_img/p_img4.png', category: 'Men', subCategory: 'Topwear',
    sizes: ['S', 'M', 'XXL'], bestseller: true,
    description: 'Classic round neck cotton T-shirt for men. Soft fabric with a comfortable fit.',
  ),
  Product(
    id: 'aaaae', name: 'Women Round Neck Cotton Top', price: 3900,
    image: '$_img/p_img5.png', category: 'Women', subCategory: 'Topwear',
    sizes: ['M', 'L', 'XL'], bestseller: true,
    description: 'Stylish round neck cotton top for women. Lightweight and perfect for layering.',
  ),
  Product(
    id: 'aaaaf', name: 'Girls Round Neck Cotton Top', price: 4200,
    image: '$_img/p_img6.png', category: 'Kids', subCategory: 'Topwear',
    sizes: ['S', 'L', 'XL'], bestseller: true,
    description: 'Adorable cotton top for girls with a round neckline. Great for school or play.',
  ),
  Product(
    id: 'aaaag', name: 'Men Tapered Fit Flat-Front Trousers', price: 5700,
    image: '$_img/p_img7.png', category: 'Men', subCategory: 'Bottomwear',
    sizes: ['S', 'L', 'XL'], bestseller: false,
    description: 'Tapered fit flat-front trousers for men. Smart casual style with a modern silhouette.',
  ),
  Product(
    id: 'aaaah', name: 'Men Round Neck Pure Cotton T-shirt', price: 4200,
    image: '$_img/p_img8.png', category: 'Men', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Essential round neck T-shirt in pure cotton. Easy to style and comfortable.',
  ),
  Product(
    id: 'aaaai', name: 'Girls Round Neck Cotton Top', price: 3000,
    image: '$_img/p_img9.png', category: 'Kids', subCategory: 'Topwear',
    sizes: ['M', 'L', 'XL'], bestseller: false,
    description: 'Simple and sweet cotton top for girls. Soft fabric for sensitive skin.',
  ),
  Product(
    id: 'aaaaj', name: 'Men Tapered Fit Flat-Front Trousers', price: 3300,
    image: '$_img/p_img10.png', category: 'Men', subCategory: 'Bottomwear',
    sizes: ['S', 'L', 'XL'], bestseller: false,
    description: 'Modern tapered trousers with a flat front. Perfect for office or casual wear.',
  ),
  Product(
    id: 'aaaak', name: 'Men Round Neck Pure Cotton T-shirt', price: 3600,
    image: '$_img/p_img11.png', category: 'Men', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L'], bestseller: false,
    description: 'Everyday pure cotton T-shirt with a classic round neck cut.',
  ),
  Product(
    id: 'aaaal', name: 'Men Round Neck Pure Cotton T-shirt', price: 4500,
    image: '$_img/p_img12.png', category: 'Men', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Premium quality cotton T-shirt. Durable and comfortable for daily use.',
  ),
  Product(
    id: 'aaaam', name: 'Women Round Neck Cotton Top', price: 3900,
    image: '$_img/p_img13.png', category: 'Women', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Elegant round neck top in soft cotton. Versatile for work or weekend.',
  ),
  Product(
    id: 'aaaan', name: 'Boy Round Neck Pure Cotton T-shirt', price: 4800,
    image: '$_img/p_img14.png', category: 'Kids', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Durable cotton T-shirt for boys. Comfortable fit for active kids.',
  ),
  Product(
    id: 'aaaao', name: 'Men Tapered Fit Flat-Front Trousers', price: 4200,
    image: '$_img/p_img15.png', category: 'Men', subCategory: 'Bottomwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Well-tailored flat-front trousers with tapered fit. Versatile and stylish.',
  ),
  Product(
    id: 'aaaap', name: 'Girls Round Neck Cotton Top', price: 5100,
    image: '$_img/p_img16.png', category: 'Kids', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Colorful cotton top for girls. Fun design with a comfortable round neckline.',
  ),
  Product(
    id: 'aaaaq', name: 'Men Tapered Fit Flat-Front Trousers', price: 4500,
    image: '$_img/p_img17.png', category: 'Men', subCategory: 'Bottomwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Sleek tapered trousers for a polished look. Comfortable stretch fabric.',
  ),
  Product(
    id: 'aaaar', name: 'Boy Round Neck Pure Cotton T-shirt', price: 5400,
    image: '$_img/p_img18.png', category: 'Kids', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Quality cotton T-shirt for boys. Easy care and long-lasting.',
  ),
  Product(
    id: 'aaaas', name: 'Boy Round Neck Pure Cotton T-shirt', price: 4800,
    image: '$_img/p_img19.png', category: 'Kids', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Casual cotton T-shirt for boys. Breathable and comfortable.',
  ),
  Product(
    id: 'aaaat', name: 'Women Palazzo Pants with Waist Belt', price: 5700,
    image: '$_img/p_img20.png', category: 'Women', subCategory: 'Bottomwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Flowy palazzo pants with an elegant waist belt. Perfect for a chic casual look.',
  ),
  Product(
    id: 'aaaau', name: 'Women Zip-Front Relaxed Fit Jacket', price: 5100,
    image: '$_img/p_img21.png', category: 'Women', subCategory: 'Winterwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Cozy zip-front jacket with a relaxed fit. Ideal for layering in cooler weather.',
  ),
  Product(
    id: 'aaaav', name: 'Women Palazzo Pants with Waist Belt', price: 6000,
    image: '$_img/p_img22.png', category: 'Women', subCategory: 'Bottomwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Wide-leg palazzo pants with a stylish waist belt. Comfortable and trendy.',
  ),
  Product(
    id: 'aaaaw', name: 'Boy Round Neck Pure Cotton T-shirt', price: 5400,
    image: '$_img/p_img23.png', category: 'Kids', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Fun and vibrant cotton T-shirt for boys. Soft fabric for all-day comfort.',
  ),
  Product(
    id: 'aaaax', name: 'Boy Round Neck Pure Cotton T-shirt', price: 6300,
    image: '$_img/p_img24.png', category: 'Kids', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Premium cotton T-shirt for boys. Stylish design with a comfortable fit.',
  ),
  Product(
    id: 'aaaay', name: 'Girls Round Neck Cotton Top', price: 5700,
    image: '$_img/p_img25.png', category: 'Kids', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Pretty cotton top for girls. Lightweight and easy to wash.',
  ),
  Product(
    id: 'aaaaz', name: 'Women Zip-Front Relaxed Fit Jacket', price: 6600,
    image: '$_img/p_img26.png', category: 'Women', subCategory: 'Winterwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Warm zip-front jacket for women. Relaxed fit with modern styling.',
  ),
  Product(
    id: 'aaaba', name: 'Girls Round Neck Cotton Top', price: 6000,
    image: '$_img/p_img27.png', category: 'Kids', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Trendy cotton top for girls. Comfortable and stylish for any occasion.',
  ),
  Product(
    id: 'aaabb', name: 'Men Slim Fit Relaxed Denim Jacket', price: 6900,
    image: '$_img/p_img28.png', category: 'Men', subCategory: 'Winterwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Classic denim jacket with a slim fit. A wardrobe essential for every season.',
  ),
  Product(
    id: 'aaabc', name: 'Women Round Neck Cotton Top', price: 6300,
    image: '$_img/p_img29.png', category: 'Women', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Chic round neck cotton top. Effortless style for everyday wear.',
  ),
  Product(
    id: 'aaabd', name: 'Girls Round Neck Cotton Top', price: 7200,
    image: '$_img/p_img30.png', category: 'Kids', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Beautiful cotton top for girls. Soft and gentle on young skin.',
  ),
  Product(
    id: 'aaabe', name: 'Men Round Neck Pure Cotton T-shirt', price: 6600,
    image: '$_img/p_img31.png', category: 'Men', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Versatile cotton T-shirt for men. Clean design with a comfortable fit.',
  ),
  Product(
    id: 'aaabf', name: 'Men Round Neck Pure Cotton T-shirt', price: 7500,
    image: '$_img/p_img32.png', category: 'Men', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'High-quality cotton T-shirt for men. Designed for comfort and durability.',
  ),
  Product(
    id: 'aaabg', name: 'Girls Round Neck Cotton Top', price: 6900,
    image: '$_img/p_img33.png', category: 'Kids', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Lovely cotton top for girls. Perfect for casual outings and playtime.',
  ),
  Product(
    id: 'aaabh', name: 'Women Round Neck Cotton Top', price: 7800,
    image: '$_img/p_img34.png', category: 'Women', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Premium round neck top for women. Soft cotton with a flattering cut.',
  ),
  Product(
    id: 'aaabi', name: 'Women Zip-Front Relaxed Fit Jacket', price: 7200,
    image: '$_img/p_img35.png', category: 'Women', subCategory: 'Winterwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Stylish zip-front jacket for women. Warm, relaxed, and easy to wear.',
  ),
  Product(
    id: 'aaabj', name: 'Women Zip-Front Relaxed Fit Jacket', price: 8100,
    image: '$_img/p_img36.png', category: 'Women', subCategory: 'Winterwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Fashionable zip-front jacket. Perfect for cool evenings and winter layering.',
  ),
  Product(
    id: 'aaabk', name: 'Women Round Neck Cotton Top', price: 7500,
    image: '$_img/p_img37.png', category: 'Women', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Comfortable cotton top with round neckline. A go-to piece for any wardrobe.',
  ),
  Product(
    id: 'aaabl', name: 'Men Round Neck Pure Cotton T-shirt', price: 8400,
    image: '$_img/p_img38.png', category: 'Men', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Soft pure cotton T-shirt for men. Ideal for casual and semi-casual wear.',
  ),
  Product(
    id: 'aaabm', name: 'Men Printed Plain Cotton Shirt', price: 7800,
    image: '$_img/p_img39.png', category: 'Men', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Printed cotton shirt for men. Smart casual style with all-day comfort.',
  ),
  Product(
    id: 'aaabn', name: 'Men Slim Fit Relaxed Denim Jacket', price: 8700,
    image: '$_img/p_img40.png', category: 'Men', subCategory: 'Winterwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Rugged denim jacket with a slim fit. A timeless piece for layered looks.',
  ),
  Product(
    id: 'aaabo', name: 'Men Round Neck Pure Cotton T-shirt', price: 8100,
    image: '$_img/p_img41.png', category: 'Men', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Relaxed fit cotton T-shirt. Perfect for weekends and casual days.',
  ),
  Product(
    id: 'aaabp', name: 'Boy Round Neck Pure Cotton T-shirt', price: 9000,
    image: '$_img/p_img42.png', category: 'Kids', subCategory: 'Topwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Durable and stylish T-shirt for boys. Made from 100% pure cotton.',
  ),
  Product(
    id: 'aaabq', name: 'Kid Tapered Slim Fit Trouser', price: 8400,
    image: '$_img/p_img43.png', category: 'Kids', subCategory: 'Bottomwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Smart tapered trousers for kids. Comfortable slim fit for active children.',
  ),
  Product(
    id: 'aaabr', name: 'Women Zip-Front Relaxed Fit Jacket', price: 9300,
    image: '$_img/p_img44.png', category: 'Women', subCategory: 'Winterwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Premium zip-front jacket for women. Soft lining with a relaxed silhouette.',
  ),
  Product(
    id: 'aaabs', name: 'Men Slim Fit Relaxed Denim Jacket', price: 8700,
    image: '$_img/p_img45.png', category: 'Men', subCategory: 'Winterwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Casual denim jacket with a relaxed slim fit. Perfect for cool weather.',
  ),
  Product(
    id: 'aaabt', name: 'Men Slim Fit Relaxed Denim Jacket', price: 9600,
    image: '$_img/p_img46.png', category: 'Men', subCategory: 'Winterwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Classic denim jacket with modern detailing. A must-have for every wardrobe.',
  ),
  Product(
    id: 'aaabu', name: 'Kid Tapered Slim Fit Trouser', price: 9000,
    image: '$_img/p_img47.png', category: 'Kids', subCategory: 'Bottomwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Comfortable tapered trousers for kids. Easy to wear and maintain.',
  ),
  Product(
    id: 'aaabv', name: 'Men Slim Fit Relaxed Denim Jacket', price: 9900,
    image: '$_img/p_img48.png', category: 'Men', subCategory: 'Winterwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Premium denim jacket with a slim relaxed fit. Ideal for all seasons.',
  ),
  Product(
    id: 'aaabw', name: 'Kid Tapered Slim Fit Trouser', price: 9300,
    image: '$_img/p_img49.png', category: 'Kids', subCategory: 'Bottomwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Stylish tapered trousers for kids. Durable fabric for everyday wear.',
  ),
  Product(
    id: 'aaabx', name: 'Kid Tapered Slim Fit Trouser', price: 10200,
    image: '$_img/p_img50.png', category: 'Kids', subCategory: 'Bottomwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Premium tapered trousers for kids. Smart and comfortable fit.',
  ),
  Product(
    id: 'aaaby', name: 'Women Zip-Front Relaxed Fit Jacket', price: 9600,
    image: '$_img/p_img51.png', category: 'Women', subCategory: 'Winterwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Elegant zip-front jacket for women. Warm and fashionable for winter.',
  ),
  Product(
    id: 'aaabz', name: 'Men Slim Fit Relaxed Denim Jacket', price: 10500,
    image: '$_img/p_img52.png', category: 'Men', subCategory: 'Winterwear',
    sizes: ['S', 'M', 'L', 'XL'], bestseller: false,
    description: 'Top-tier denim jacket with slim fit styling. Built to last.',
  ),
];

// Helper getters
List<Product> get bestsellerProducts =>
    allProducts.where((p) => p.bestseller).toList();

List<Product> getProductsByCategory(String category) {
  if (category == 'All') return allProducts;
  return allProducts.where((p) => p.category == category).toList();
}

List<Product> getProductsBySubCategory(String subCategory) =>
    allProducts.where((p) => p.subCategory == subCategory).toList();

List<Product> searchProducts(String query) {
  final q = query.toLowerCase();
  return allProducts.where((p) =>
    p.name.toLowerCase().contains(q) ||
    (p.category?.toLowerCase().contains(q) ?? false) ||
    (p.subCategory?.toLowerCase().contains(q) ?? false)
  ).toList();
}
