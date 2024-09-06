
import 'package:equatable/equatable.dart';
import 'galeri_models.dart';

abstract class GalleryState extends Equatable {
  const GalleryState();
  
  @override
  List<Object> get props => [];
}

class GalleryInitial extends GalleryState {}

class GalleryLoading extends GalleryState {}

class GalleryLoaded extends GalleryState {
  final List<WisataJson> wisatas;

  const GalleryLoaded(this.wisatas);

  @override
  List<Object> get props => [wisatas];
}

class GalleryError extends GalleryState {
  final String message;

  const GalleryError(this.message);

  @override
  List<Object> get props => [message];
}
