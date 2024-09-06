import 'package:equatable/equatable.dart';
import 'galeri_models.dart';

abstract class GaleriState extends Equatable {
  const GaleriState();
  
  @override
  List<Object> get props => [];
}

class GaleriInitial extends GaleriState {}

class GaleriLoading extends GaleriState {}

class GaleriLoaded extends GaleriState {
  final List<WisataJson> wisatas;

  const GaleriLoaded(this.wisatas);

  @override
  List<Object> get props => [wisatas];
}

class GaleriError extends GaleriState {
  final String message;

  const GaleriError(this.message);

  @override
  List<Object> get props => [message];
}