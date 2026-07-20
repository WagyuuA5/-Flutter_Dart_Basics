extension PriceFormatting on double {
  String toRupiah() => 'Rp${toStringAsFixed(0)}';
}
