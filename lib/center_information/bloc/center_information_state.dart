import 'package:beefitmember_application/center_information/models/center_information_model.dart';
import 'package:equatable/equatable.dart';

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

  InfoLoadedState({required this.model});

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
