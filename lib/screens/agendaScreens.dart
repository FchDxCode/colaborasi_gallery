import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/agenda/agenda_bloc.dart';
import '../bloc/agenda/agenda_event.dart';
import '../bloc/agenda/agenda_state.dart';

class AgendaScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
      ),
      body: BlocBuilder<AgendaBloc, AgendaState>(
        builder: (context, state) {
          if (state is AgendaInitial) {
            BlocProvider.of<AgendaBloc>(context).add(FetchAgenda());
            return Center(child: CircularProgressIndicator());
          } else if (state is AgendaLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AgendaLoaded) {
            return ListView.builder(
              itemCount: state.wisatas.length,
              itemBuilder: (context, index) {
                final wisata = state.wisatas[index];
                return Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0), // Add margin around each item
                  decoration: BoxDecoration(
                    color: Colors.blue, // Set background color of each box
                    border: Border.all(color: Colors.grey), // Add border
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                  child: Stack(
                    children: [
                      ListTile(
                        title: Text(
                          wisata.Judul ?? '',
                          style: TextStyle(
                              color: Colors.white), // White text for contrast
                        ),
                        subtitle: Text(
                          wisata.Deskripsi ?? '',
                          style: TextStyle(
                              color:
                                  Colors.white), // White subtitle for contrast
                        ),
                      ),
                      Positioned(
                        bottom: 8.0,
                        right: 16.0,
                        child: Text(
                          wisata.Tanggal ??
                              'Lokasi tidak tersedia', // New location field
                          style: TextStyle(
                              color:
                                  Colors.white70, // Slightly transparent white
                              fontSize: 12.0 // Smaller font size
                              ),
                        ),
                      ),
                    ],
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
