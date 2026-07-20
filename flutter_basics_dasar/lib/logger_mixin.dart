/// Mixin untuk mencatat log aktivitas.
/// Bisa ditempelkan ke kelas manapun tanpa menggunakan pewarisan (inheritance).
mixin LoggerMixin {
  void log(String message) {
    // Mengambil waktu saat ini untuk log
    final time = DateTime.now().toIso8601String().split('T')[1].substring(0, 8);
    print('[$time] LOG: $message');
  }
}
