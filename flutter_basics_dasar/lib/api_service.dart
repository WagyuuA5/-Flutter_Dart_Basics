import 'product.dart';
import 'logger_mixin.dart';

/// Simulasi layanan untuk mengambil data dari internet (Asynchronous)
class ApiService with LoggerMixin {
  /// Menggunakan Future, async, dan await
  Future<List<Product>> fetchProducts() async {
    log('Mengakses database jarak jauh...');
    
    // Simulasi waktu tunggu jaringan (delay 2 detik)
    await Future.delayed(const Duration(seconds: 2));
    
    final mockJsonFromApi = [
      {'name': 'MacBook Pro', 'price': 25000000, 'stock': 5},
      {'name': 'Mouse Logitech', 'price': 150000, 'stock': 0},
      {'name': 'Mechanical Keyboard', 'price': 950000, 'stock': 12},
    ];

    log('Berhasil mengunduh data!');
    
    // Konversi List<Map> menjadi List<Product> menggunakan Factory fromMap
    return mockJsonFromApi.map((json) => Product.fromMap(json)).toList();
  }
}
