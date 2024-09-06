import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../bloc/galeri/galeri_repo.dart';

class GaleriScreens extends StatelessWidget {
  Future<List<WisataJson>> fetchWisata() async {
    final response =
        await http.get(Uri.parse('https://ws.jakarta.go.id/gateway/DataPortalSatuDataJakarta/1.0/satudata?kategori=dataset&tipe=detail&url=indeks-kepuasan-layanan-penunjang-urusan-pemerintahan-daerah-pada-dinas-pariwisata-dan-ekonomi-kreatif'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((wisata) => WisataJson.fromJson(wisata)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: FutureBuilder<List<WisataJson>?>(
        future: fetchWisata(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final wisatas = snapshot.data;
            return ListView.builder(
              itemCount: wisatas?.length ?? 0,
              itemBuilder: (context, index) {
                final wisata = wisatas?[index];
                return ListTile(
                  title: Text(wisata?.periodeData ?? ''),
                  subtitle: Text(wisata?.triwulan1 ?? ''),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}