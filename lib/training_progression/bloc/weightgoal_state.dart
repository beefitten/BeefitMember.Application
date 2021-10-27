import 'package:equatable/equatable.dart';

class WeightGoalState extends Equatable {
  @override
  List<Object> get props => [];
}

class WegihtGoalInitState extends WeightGoalState {}

class WegihtGoalLoadingState extends WeightGoalState {}

class WegihtGoalErrorState extends WeightGoalState {
  final String message;

  WegihtGoalErrorState({required this.message});
}
