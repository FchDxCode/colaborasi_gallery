import 'package:flutter/material.dart';
import 'infoScreens.dart';
import 'galeriScreens.dart';
import 'agendaScreens.dart';

class BerandaScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.purple], // Gradasi biru ke ungu
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol navigasi ke halaman Info
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), // Jarak antar box
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.cyan, Colors.purple], // Gradasi box
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Shadow posisi
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Background transparan karena gradien
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoScreens()),
                    );
                  },
                  child: Text('Go to Info', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            // Tombol navigasi ke halaman Galeri
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.red], // Gradasi warna untuk galeri
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GaleriScreens()),
                    );
                  },
                  child: Text('Go to Galeri', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            // Tombol navigasi ke halaman Agenda
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green, Colors.blue], // Gradasi warna untuk agenda
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AgendaScreens()),
                    );
                  },
                  child: Text('Go to Agenda', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
