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
      Judul: json['title'],
      Deskripsi: json['desc'],
      Tanggal: json['created_at'], // Fetching lokasi from JSON
    );
  }
}
