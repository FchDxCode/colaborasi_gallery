class WisataJson {
  final String Judul;
  final String Deskripsi;
  final String Tanggal; // New lokasi field

  // Constructor including lokasi
  WisataJson({
    required this.Judul,
    required this.Deskripsi,
    required this.Tanggal,
  });

  // Factory method updated to handle lokasi
  factory WisataJson.fromJson(Map<String, dynamic> json) {
    return WisataJson(
      Judul: json['periode_data'],
      Deskripsi: json['triwulan'],
      Tanggal: json['jenis_layanan'], // Fetching lokasi from JSON
    );
  }
}
