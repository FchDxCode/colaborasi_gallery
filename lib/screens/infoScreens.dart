import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/info/info_bloc.dart';
import '../bloc/info/info_event.dart';
import '../bloc/info/info_state.dart';

class InfoScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.cyan, Colors.purple], // Gradasi cyan ke ungu
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.cyan.withOpacity(0.5), // Warna cyan dengan transparansi 50%
              Colors.purple.withOpacity(0.5) // Warna ungu dengan transparansi 50%
            ],
          ),
        ),
        child: BlocBuilder<InfoBloc, InfoState>(
          builder: (context, state) {
            if (state is InfoInitial) {
              BlocProvider.of<InfoBloc>(context).add(FetchInfo());
              return Center(child: CircularProgressIndicator());
            } else if (state is InfoLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is InfoLoaded) {
              return ListView.builder(
                padding: EdgeInsets.all(10), // Padding di sekitar ListView
                itemCount: state.wisatas.length,
                itemBuilder: (context, index) {
                  final wisata = state.wisatas[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0), // Padding antar box
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue[100]!.withOpacity(0.8), // Gradasi biru muda dengan transparansi
                            Colors.deepPurple[100]!.withOpacity(0.8) // Gradasi ungu muda dengan transparansi
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12), // Membuat sudut rounded
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Warna shadow
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // Posisi shadow
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // Bagian ListTile
                          ListTile(
                            contentPadding: EdgeInsets.all(16), // Padding dalam ListTile
                            title: Text(
                              wisata.periodeData ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent, // Warna teks judul
                              ),
                            ),
                            subtitle: Text(
                              wisata.triwulan1 ?? '',
                              style: TextStyle(
                                color: Colors.black54, // Warna teks pertama
                              ),
                            ),
                            leading: Icon(Icons.info, color: Colors.blue), // Ikon di bagian kiri
                            trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue), // Ikon di bagian kanan
                          ),
                          
                          // Posisi untuk nilai1 di pojok kanan bawah
                          Positioned(
                            bottom: 10,
                            right: 16,
                            child: Text(
                              wisata.nilai1 ?? '',
                              style: TextStyle(
                                color: Colors.grey, // Warna teks abu-abu
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is InfoError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
