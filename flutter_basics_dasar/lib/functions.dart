/// Utility function berbasis Generic.
/// Mengambil elemen pertama dari [List] atau mengembalikan [defaultValue] 
/// jika list kosong. Menghindari `StateError`.
T firstOrDefault<T>(List<T> list, T defaultValue) {
  return list.isNotEmpty ? list.first : defaultValue;
}
