class WisataJson {
  final String periodeData;
  final String triwulan1;
  final String nilai1;
  WisataJson({ required this.periodeData, required this.triwulan1, required this.nilai1});
  factory WisataJson.fromJson(Map<String, dynamic> json) {
    return WisataJson(
      periodeData: json['title'],
      triwulan1: json['desc'],
      nilai1: json['created_at'],
    );
  }
}
