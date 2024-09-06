import 'package:http/http.dart' as http;
import 'dart:convert';
import 'agenda_models.dart';

class AgendaRepository {
  Future<List<WisataJson>> fetchWisata() async {
    final response = await http.get(Uri.parse(
        'https://ws.jakarta.go.id/gateway/DataPortalSatuDataJakarta/1.0/satudata?kategori=dataset&tipe=detail&url=indeks-kepuasan-layanan-penunjang-urusan-pemerintahan-daerah-pada-dinas-pariwisata-dan-ekonomi-kreatif'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((wisata) => WisataJson.fromJson(wisata)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }
}
