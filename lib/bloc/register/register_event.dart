import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterButtonPressed extends RegisterEvent {
  final String name;
  final String email;
  final String password;
   // Biasanya di proses register ada username atau nama.

  const RegisterButtonPressed({
    required this.name,
    required this.email, 
    required this.password,

  });

  @override
  List<Object> get props => [name,email, password, ];
}
