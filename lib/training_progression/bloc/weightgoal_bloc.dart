import 'package:beefitmember_application/training_progression/bloc/weightgoal_events.dart';
import 'package:beefitmember_application/training_progression/bloc/weightgoal_state.dart';
import 'package:beefitmember_application/training_progression/services/weightgoal_service.dart';
import 'weightgoal_events.dart';
import 'weightgoal_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeightGoalBloc extends Bloc<WeightGoalEvents, WeightGoalState> {
  WeightGoalService service;

  WeightGoalBloc(WeightGoalState initialState, this.service)
      : super(initialState);

  @override
  Stream<WeightGoalState> mapEventToState(WeightGoalEvents event) async* {
    if (event is SaveButtonPressed) {
      yield WeightGoalLoadingState();
    }
  }
}
