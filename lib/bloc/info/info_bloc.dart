import 'package:flutter_bloc/flutter_bloc.dart';
import 'info_repo.dart';
import 'info_event.dart';
import 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final InfoRepository repository;

  InfoBloc({required this.repository}) : super(InfoInitial()) {
    on<FetchInfo>((event, emit) async {
      emit(InfoLoading());
      try {
        final wisatas = await repository.fetchWisata();
        emit(InfoLoaded(wisatas));
      } catch (e) {
        emit(InfoError(e.toString()));
      }
    });
  }
}