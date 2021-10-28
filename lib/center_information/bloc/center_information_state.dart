import 'package:beefitmember_application/center_information/models/center_information_model.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class CenterInformationState extends Equatable {}

class InfoInitialState extends CenterInformationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InfoLoadingState extends CenterInformationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InfoLoadedState extends CenterInformationState {
  final CenterInformationModel model;
  final GoogleMap map;

  InfoLoadedState({required this.model, required this.map});

  @override
  // TODO: implement props
  List<Object?> get props => [model];
}

class InfoErrorState extends CenterInformationState {
  final String message;

  InfoErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
