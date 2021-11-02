import 'dart:convert';

import 'package:beefitmember_application/training_progression/models/weight_goal_model.dart';
import 'package:equatable/equatable.dart';

class WeightGoalState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeightGoalInitState extends WeightGoalState {}

class LoadingWeightGoalState extends WeightGoalState {}

class WeightGoalSuccessState extends WeightGoalState {}

class WeightGoalErrorState extends WeightGoalState {
  final String message;

  WeightGoalErrorState({required this.message});
}

class CreateWeightGoalState extends WeightGoalState {}

class ShowWeightGoalState extends WeightGoalState {
  final WeightGoalModel json;

  ShowWeightGoalState({required this.json});
}
