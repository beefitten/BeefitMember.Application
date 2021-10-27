import 'package:beefitmember_application/center_information/bloc/center_information_events.dart';
import 'package:beefitmember_application/center_information/bloc/center_information_state.dart';
import 'package:beefitmember_application/center_information/models/center_information_model.dart';
import 'package:beefitmember_application/center_information/service/center_information_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CenterInformationBloc
    extends Bloc<CenterInformationEvents, CenterInformationState> {
  CenterInformationService infoService;

  CenterInformationBloc(this.infoService) : super(InfoInitialState());

  @override
  Stream<CenterInformationState> mapEventToState(
      CenterInformationEvents event) async* {
    if (event is LoadEvent) {
      yield InfoLoadingState();
      try {
        CenterInformationModel response =
            await infoService.getData(event.fitnessName);
        yield InfoLoadedState(model: response);
      } catch (e) {
        yield InfoErrorState(message: "Could not gather center information");
      }
    }
  }

  void dispose() {}
}





  // @override
  // CenterInformationState get initialState

  