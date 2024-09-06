import 'package:http/http.dart' as http;
import 'dart:convert';
import 'agenda_models.dart';

class AgendaRepository {
  Future<List<WisataJson>> fetchWisata() async {
    final response = await http.get(Uri.parse(
        'https://praktikum-cpanel-unbin.com/api_bumi_fachru_fahrizal_alif_fatir/api/agenda'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((wisata) => WisataJson.fromJson(wisata)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }
}
