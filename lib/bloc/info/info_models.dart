class WisataJson {
  final String periodeData;
  final String triwulan1;
  final String nilai1;
  WisataJson({ required this.periodeData, required this.triwulan1, required this.nilai1});
  factory WisataJson.fromJson(Map<String, dynamic> json) {
    return WisataJson(
      periodeData: json['periode_data'],
      triwulan1: json['triwulan'],
      nilai1: json['nilai_indeks'],
    );
  }
}