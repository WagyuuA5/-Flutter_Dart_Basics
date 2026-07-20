/// Enhanced Enum (Dart 2.17+)
/// Enum modern yang memiliki tipe data, properti, dan metodenya sendiri.
enum ProductStatus {
  available('Tersedia', true),
  outOfStock('Habis', false),
  archived('Diarsipkan', false);

  final String label;
  final bool canBeSold;

  const ProductStatus(this.label, this.canBeSold);
}
