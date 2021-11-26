import 'package:equatable/equatable.dart';

class WeightGoalEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends WeightGoalEvents {}

class SaveButtonPressed extends WeightGoalEvents {
  final String user;
  final int currentWeight;
  final int targetWeight;

  SaveButtonPressed({
    required this.user,
    required this.currentWeight,
    required this.targetWeight,
  });
}

class WeightGoalLoadingEvent extends WeightGoalEvents {
  final String user;

  WeightGoalLoadingEvent({
    required this.user,
  });
}
