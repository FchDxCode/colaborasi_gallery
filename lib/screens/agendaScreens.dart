import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/agenda/agenda_bloc.dart';
import '../bloc/agenda/agenda_event.dart';
import '../bloc/agenda/agenda_state.dart';

class AgendaScreens extends StatelessWidget {
  const AgendaScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
      ),
      body: BlocBuilder<AgendaBloc, AgendaState>(
        builder: (context, state) {
          if (state is AgendaInitial) {
            BlocProvider.of<AgendaBloc>(context).add(FetchAgenda());
            return const Center(child: CircularProgressIndicator());
          } else if (state is AgendaLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AgendaLoaded) {
            return ListView.builder(
              itemCount: state.wisatas.length,
              itemBuilder: (context, index) {
                final wisata = state.wisatas[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0), // Add margin around each item
                  decoration: BoxDecoration(
                    color: Colors.blue, // Set background color of each box
                    border: Border.all(color: Colors.grey), // Add border
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Add padding inside the container
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Logo di sebelah kiri
                        Container(
                          margin: const EdgeInsets.only(
                              right: 16.0), // Add space between logo and text
                          child: const Icon(
                            Icons.event, // Using a built-in agenda icon
                            size: 40.0, // Size of the logo
                            color: Colors.white,
                          ),
                        ),
                        // Bagian teks (judul, deskripsi, dan tanggal)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Judul
                              Text(
                                wisata.Judul ?? '',
                                style: const TextStyle(
                                  color:
                                      Colors.white, // White text for contrast
                                  fontSize: 20.0, // Make title text larger
                                  fontWeight: FontWeight.bold, // Bold text
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      4.0), // Add space between title and description
                              // Deskripsi
                              Text(
                                wisata.Deskripsi ?? '',
                                style: const TextStyle(
                                  color: Colors
                                      .white, // White subtitle for contrast
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      8.0), // Add space between description and date
                              // Tanggal
                              Text(
                                wisata.Tanggal ?? 'Lokasi tidak tersedia',
                                style: const TextStyle(
                                  color: Colors
                                      .white70, // Slightly transparent white
                                  fontSize: 12.0, // Smaller font size for date
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is AgendaError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}
