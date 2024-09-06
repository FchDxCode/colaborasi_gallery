import 'package:flutter_bloc/flutter_bloc.dart';
import 'agenda_repo.dart';
import 'agenda_event.dart';
import 'agenda_state.dart';

class AgendaBloc extends Bloc<AgendaEvent, AgendaState> {
  final AgendaRepository repository;

  AgendaBloc({required this.repository}) : super(AgendaInitial()) {
    on<FetchAgenda>((event, emit) async {
      emit(AgendaLoading());
      try {
        final wisatas = await repository.fetchWisata();
        emit(AgendaLoaded(wisatas));
      } catch (e) {
        emit(AgendaError(e.toString()));
      }
    });
  }
}
