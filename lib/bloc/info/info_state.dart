import 'package:equatable/equatable.dart';
import 'info_models.dart';

abstract class InfoState extends Equatable {
  const InfoState();
  
  @override
  List<Object> get props => [];
}

class InfoInitial extends InfoState {}

class InfoLoading extends InfoState {}

class InfoLoaded extends InfoState {
  final List<WisataJson> wisatas;

  const InfoLoaded(this.wisatas);

  @override
  List<Object> get props => [wisatas];
}

class InfoError extends InfoState {
  final String message;

  const InfoError(this.message);

  @override
  List<Object> get props => [message];
}