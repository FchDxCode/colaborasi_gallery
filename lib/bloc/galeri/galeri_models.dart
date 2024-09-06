class WisataJson {
  final String periodeData;
  final String triwulan1;
  WisataJson({ required this.periodeData, required this.triwulan1});
  factory WisataJson.fromJson(Map<String, dynamic> json) {
    return WisataJson(
      periodeData: json['periode_data'],
      triwulan1: json['triwulan'],
    );
  }
}