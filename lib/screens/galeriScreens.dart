
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/galeri/galeri_bloc.dart';
import '../bloc/galeri/galeri_event.dart';
import '../bloc/galeri/galeri_state.dart';
import '../widgets/comic_title.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          if (state is GalleryInitial) {
            BlocProvider.of<GalleryBloc>(context).add(FetchGallery());
            return const Center(child: CircularProgressIndicator());
          } else if (state is GalleryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GalleryLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemCount: state.wisatas.length,
              itemBuilder: (context, index) {
                final wisata = state.wisatas[index];
                return ComicTile(wisata: wisata);
              },
            );
          } else if (state is GalleryError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}
