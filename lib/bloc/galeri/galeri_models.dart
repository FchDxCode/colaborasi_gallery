
class WisataJson {
  final String imageUrl;
  final String titleData;
  final String descData;

  WisataJson({required this.imageUrl, required this.titleData, required this.descData});

  factory WisataJson.fromJson(Map<String, dynamic> json) {
    return WisataJson(
      imageUrl: json['img'] ?? '',
      titleData: json['title'] ?? '',
      descData: json['desc'] ?? '',
    );
  }
}
