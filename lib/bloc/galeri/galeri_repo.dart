import 'package:http/http.dart' as http;
import 'dart:convert';
import 'galeri_models.dart';

class GalleryRepository {
  Future<List<WisataJson>> fetchWisata() async {
    try {
      final response = await http.get(Uri.parse('https://praktikum-cpanel-unbin.com/api_bumi_fachru_fahrizal_alif_fatir/api/gallery'));
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        
        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          final List<dynamic> data = jsonResponse['data'];
          return data.map((wisata) => WisataJson.fromJson(wisata)).toList();
        } else {
          throw Exception('Unexpected JSON structure');
        }
      } else {
        throw Exception('Failed to load: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load: $e');
    }
  }
}
