import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../bloc/info/info_repo.dart';

class InfoScreens extends StatelessWidget {
  Future<List<KesehatanJson>> fetchKesehatan() async {
    final response =
        await http.get(Uri.parse('https://ws.jakarta.go.id/gateway/DataPortalSatuDataJakarta/1.0/satudata?kategori=dataset&tipe=detail&url=perempuan-dan-anak-korban-kekerasan-yang-mendapatkan-layanan-kesehatan-oleh-tenaga-kesehatan-terlatih-di-puskesmas-mampu-tatalaksana-kekerasan-terhadap-perempuananak-ktpa-dan-pusat-pelayanan-terpadupusat-krisis-terpadu-pptpkt-di-rumah-sakit'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((kesehatan) => KesehatanJson.fromJson(kesehatan)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: FutureBuilder<List<KesehatanJson>?>(
        future: fetchKesehatan(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final kesehatans = snapshot.data;
            return ListView.builder(
              itemCount: kesehatans?.length ?? 0,
              itemBuilder: (context, index) {
                final kesehatan = kesehatans?[index];
                return ListTile(
                  title: Text(kesehatan?.periodeData ?? ''),
                  subtitle: Text(kesehatan?.wilayah ?? ''),
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