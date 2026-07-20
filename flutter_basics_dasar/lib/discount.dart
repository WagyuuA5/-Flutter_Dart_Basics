/// Sealed Class (Fitur Utama Dart 3)
/// Kelas ini hanya bisa di-extend di dalam file ini saja. 
/// Sangat aman dan cocok digabungkan dengan Pattern Matching (Switch Expression).
sealed class Discount {}

class StandardDiscount extends Discount {
  final double percentage;
  StandardDiscount(this.percentage);
}

class FlatDiscount extends Discount {
  final double amount;
  FlatDiscount(this.amount);
}

class NoDiscount extends Discount {}

/// Fungsi ini menggunakan Pattern Matching dan mengembalikan **Record** (Dart 3).
/// Record memungkinkan kita me-return lebih dari satu nilai sekaligus (harga akhir, jumlah hemat).
(double finalPrice, double savedAmount) calculateDiscount(double originalPrice, Discount discount) {
  // Switch Expression (Dart 3) - lebih ringkas dari if-else atau switch statement biasa.
  // Kompiler akan protes jika kita tidak menangani semua subclass dari `Discount`.
  return switch (discount) {
    StandardDiscount(percentage: final p) => (
        originalPrice - (originalPrice * p / 100), // finalPrice
        originalPrice * p / 100                    // savedAmount
      ),
    FlatDiscount(amount: final a) => (
        originalPrice - a < 0 ? 0 : originalPrice - a,
        originalPrice - a < 0 ? originalPrice : a
      ),
    NoDiscount() => (originalPrice, 0.0),
  };
}
