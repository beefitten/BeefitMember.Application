import 'package:equatable/equatable.dart';

class WeightGoalState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeightGoalInitState extends WeightGoalState {}

class WeightGoalLoadingState extends WeightGoalState {}

class WeightGoalSuccessState extends WeightGoalState {}

class WeightGoalErrorState extends WeightGoalState {
  final String message;

  WeightGoalErrorState({required this.message});
}
