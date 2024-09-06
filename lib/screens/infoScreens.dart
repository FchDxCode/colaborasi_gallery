import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/info/info_bloc.dart';
import '../bloc/info/info_event.dart';
import '../bloc/info/info_state.dart';

class InfoScreens extends StatelessWidget {
  const InfoScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
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
              return const Center(child: CircularProgressIndicator());
            } else if (state is InfoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is InfoLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(10), // Padding di sekitar ListView
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
                            offset: const Offset(0, 3), // Posisi shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0), // Padding dalam Container
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Menyusun teks ke kiri
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero, // Hilangkan padding default ListTile
                              title: Text(
                                wisata.periodeData ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent, // Warna teks judul
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0), // Padding antara subtitle dan teks bawah
                                child: Text(
                                  wisata.triwulan1 ?? '',
                                  style: const TextStyle(
                                    color: Colors.black54, // Warna teks pertama
                                  ),
                                ),
                              ),
                              leading: const Icon(Icons.info, color: Colors.blue), // Ikon di bagian kiri
                              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blue), // Ikon di bagian kanan
                            ),
                            Align(
                              alignment: Alignment.bottomRight, // Tempatkan teks di kanan bawah
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0), // Jarak antara teks dan subtitle di atasnya
                                child: Text(
                                  wisata.nilai1 ?? '',
                                  style: const TextStyle(
                                    color: Colors.grey, // Warna teks abu-abu
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
