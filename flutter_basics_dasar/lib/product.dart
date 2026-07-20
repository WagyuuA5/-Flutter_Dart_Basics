import 'product_status.dart';
import 'logger_mixin.dart';
import 'extensions.dart';

/// Class Product sekarang menggunakan [LoggerMixin] dengan kata kunci `with`.
class Product with LoggerMixin {
  final String name;
  final double price;
  final int stock;
  final ProductStatus status;

  const Product({
    required this.name,
    required this.price,
    this.stock = 0,
    this.status = ProductStatus.available,
  });

  /// Factory constructor
  factory Product.fromMap(Map<String, dynamic> map) {
    final stock = map['stock'] as int? ?? 0;
    return Product(
      name: map['name'] as String,
      price: (map['price'] as num).toDouble(),
      stock: stock,
      // Logika bisnis penentuan Enum berdasarkan stok
      status: stock > 0 ? ProductStatus.available : ProductStatus.outOfStock,
    );
  }

  String get formattedPrice => price.toRupiah();

  /// Method yang memanggil fungsi log dari LoggerMixin
  void checkInventory() {
    log('Mengecek inventori untuk $name. Sisa: $stock unit.');
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product &&
        other.name == name &&
        other.price == price &&
        other.stock == stock &&
        other.status == status; // Bandingkan juga Enum-nya
  }

  @override
  int get hashCode => Object.hash(name, price, stock, status);

  @override
  String toString() => 'Product(name: "$name", price: $formattedPrice, status: ${status.label})';
}
