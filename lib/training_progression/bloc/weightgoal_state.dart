import 'package:equatable/equatable.dart';

class WeightGoalState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeightGoalSaveState extends WeightGoalState {}

class WeightGoalErrorState extends WeightGoalState {
  final String message;

  WeightGoalErrorState({required this.message});
}
