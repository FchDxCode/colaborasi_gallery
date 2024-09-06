
import 'package:flutter_bloc/flutter_bloc.dart';
import 'galeri_repo.dart';
import 'galeri_event.dart';
import 'galeri_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GalleryRepository repository;

  GalleryBloc({required this.repository}) : super(GalleryInitial()) {
    on<FetchGallery>((event, emit) async {
      emit(GalleryLoading());
      try {
        final wisatas = await repository.fetchWisata();
        emit(GalleryLoaded(wisatas));
      } catch (error) {
        emit(GalleryError(error.toString()));
      }
    });
  }
}
