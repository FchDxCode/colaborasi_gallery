import 'package:equatable/equatable.dart';
import 'agenda_models.dart';

abstract class AgendaState extends Equatable {
  const AgendaState();

  @override
  List<Object> get props => [];
}

class AgendaInitial extends AgendaState {}

class AgendaLoading extends AgendaState {}

class AgendaLoaded extends AgendaState {
  final List<WisataJson> wisatas;

  const AgendaLoaded(this.wisatas);

  @override
  List<Object> get props => [wisatas];
}

class AgendaError extends AgendaState {
  final String message;

  const AgendaError(this.message);

  @override
  List<Object> get props => [message];
}
