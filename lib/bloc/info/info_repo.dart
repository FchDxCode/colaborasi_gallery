class KesehatanJson {
  final String periodeData;
  final String wilayah;
  KesehatanJson({ required this.periodeData, required this.wilayah});
  factory KesehatanJson.fromJson(Map<String, dynamic> json) {
    return KesehatanJson(
      periodeData: json['periode_data'],
      wilayah: json['wilayah'],
    );
  }
}
