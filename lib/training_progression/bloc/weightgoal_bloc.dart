import 'package:beefitmember_application/training_progression/bloc/weightgoal_events.dart';
import 'package:beefitmember_application/training_progression/bloc/weightgoal_states.dart';
import 'package:beefitmember_application/training_progression/services/weightgoal_service.dart';
import 'weightgoal_events.dart';
import 'weightgoal_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeightGoalBloc extends Bloc<WeightGoalEvents, WeightGoalState> {
  WeightGoalService service;

  WeightGoalBloc(WeightGoalState initialState, this.service)
      : super(initialState);

  @override
  Stream<WeightGoalState> mapEventToState(WeightGoalEvents event) async* {
    if (event is StartEvent) {
      yield WeightGoalInitState();
    }
    if (event is SaveButtonPressed) {
      yield WeightGoalLoadingState();
      var response = await service.create(
        event.user,
        event.currentWeight,
        event.targetWeight,
      );
      if (response == 200) {
        yield WeightGoalSuccessState();
      } else {
        yield WeightGoalErrorState(message: "Error occured");
      }
    }
    if (event is LoadingWeightGoalEvent) {
      var response = await service.get(event.user);

      if (response == "error") {
        yield WeightGoalErrorState(message: "ERMEGHERD SOMTHG WRNG!!!");
      } else if (response == "empty") {
        yield WeightGoalCreateState();
      } else {
        yield WeightGoalShowState(json: response);
      }
    }
  }
}
