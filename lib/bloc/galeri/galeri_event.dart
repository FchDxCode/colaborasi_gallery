import 'package:equatable/equatable.dart';

abstract class GaleriEvent extends Equatable {
  const GaleriEvent();

  @override
  List<Object> get props => [];
}

class FetchGaleri extends GaleriEvent {}