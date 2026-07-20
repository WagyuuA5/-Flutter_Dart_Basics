import 'product.dart';
import 'discount.dart';
import 'api_service.dart';
import 'extensions.dart';

// main() dimodifikasi menjadi `async` karena memanggil fungsi Asynchronous
void main() async {
  print('===================================================');
  print('                  basic_1_dasar                    ');
  print('===================================================\n');

  // 1. ASYNC / AWAIT
  print('--- 1. ASYNC / AWAIT (FUTURES) ---');
  final api = ApiService();
  final products = await api.fetchProducts(); // Menunggu proses selesai
  print('\n');

  // 2. MIXINS
  print('--- 2. MIXINS ---');
  // Memanggil method yang berasal dari LoggerMixin di dalam class Product
  products.first.checkInventory();
  print('\n');

  // 3. HIGHER ORDER FUNCTION & ENUM
  print('--- 3. FILTERING & ENUM PROPERTIES ---');
  // Memfilter hanya produk yang bisa dijual (canBeSold == true dari Enum)
  final sellableProducts = products.where((p) => p.status.canBeSold).toList();
  print('Produk yang siap dijual:');
  for (var p in sellableProducts) {
    print('- $p');
  }
  print('\n');

  // 4. SEALED CLASSES, PATTERN MATCHING & RECORDS (DART 3)
  print('--- 4. SEALED CLASS, PATTERN MATCHING & RECORDS ---');
  final productToBuy = sellableProducts.first;
  
  // Mencoba berbagai jenis diskon (Sealed Class)
  final List<Discount> promos = [
    StandardDiscount(15), // Diskon 15%
    FlatDiscount(500000), // Potongan langsung Rp500.000
    NoDiscount(),         // Tanpa diskon
  ];

  for (var promo in promos) {
    // Destructuring Record (mengambil 2 nilai kembalian sekaligus)
    final (finalPrice, savedAmount) = calculateDiscount(productToBuy.price, promo);
    
    print('Tipe Promo : ${promo.runtimeType}');
    print('Harga Awal : ${productToBuy.formattedPrice}');
    print('Hemat      : ${savedAmount.toRupiah()}');
    print('Bayar      : ${finalPrice.toRupiah()}');
    print('---------------------------');
  }
}
