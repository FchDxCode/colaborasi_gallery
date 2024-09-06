import 'package:flutter_bloc/flutter_bloc.dart';
import 'galeri_repo.dart';
import 'galeri_event.dart';
import 'galeri_state.dart';

class GaleriBloc extends Bloc<GaleriEvent, GaleriState> {
  final GaleriRepository repository;

  GaleriBloc({required this.repository}) : super(GaleriInitial()) {
    on<FetchGaleri>((event, emit) async {
      emit(GaleriLoading());
      try {
        final wisatas = await repository.fetchWisata();
        emit(GaleriLoaded(wisatas));
      } catch (e) {
        emit(GaleriError(e.toString()));
      }
    });
  }
}