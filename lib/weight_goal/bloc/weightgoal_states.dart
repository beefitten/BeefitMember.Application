import 'package:beefitmember_application/weight_goal/models/weight_goal_model.dart';
import 'package:equatable/equatable.dart';

class WeightGoalState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeightGoalInitState extends WeightGoalState {}

class WeightGoalLoadingState extends WeightGoalState {}

class WeightGoalErrorState extends WeightGoalState {
  final String message;

  WeightGoalErrorState({required this.message});
}

class WeightGoalCreateState extends WeightGoalState {}

class WeightGoalShowState extends WeightGoalState {
  final WeightGoalModel json;

  WeightGoalShowState({required this.json});
}
