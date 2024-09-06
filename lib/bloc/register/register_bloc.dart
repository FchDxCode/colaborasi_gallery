import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_repo.dart'; // Ganti dengan RegisterRepo
import 'register_event.dart'; // Event yang telah dibuat untuk registrasi
import 'register_state.dart'; // State untuk registrasi

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepo repository; // Ganti dengan RegisterRepo

  RegisterBloc({required this.repository}) : super(RegisterInitial()) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoading());
      try {
        await repository.register(event.name, event.email, event.password); // Panggil register di repository
        emit(RegisterSuccess());
      } catch (error) {
        emit(RegisterFailure(error: error.toString()));
      }
    });
  }
}
