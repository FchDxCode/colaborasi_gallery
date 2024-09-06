import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/galeri/galeri_bloc.dart';
import '../bloc/galeri/galeri_event.dart';
import '../bloc/galeri/galeri_state.dart';

class GaleriScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: BlocBuilder<GaleriBloc, GaleriState>(
        builder: (context, state) {
          if (state is GaleriInitial) {
            BlocProvider.of<GaleriBloc>(context).add(FetchGaleri());
            return Center(child: CircularProgressIndicator());
          } else if (state is GaleriLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GaleriLoaded) {
            return ListView.builder(
              itemCount: state.wisatas.length,
              itemBuilder: (context, index) {
                final wisata = state.wisatas[index];
                return ListTile(
                  title: Text(wisata.periodeData ?? ''),
                  subtitle: Text(wisata.triwulan1 ?? ''),
                );
              },
            );
          } else if (state is GaleriError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}