import 'package:beefitmember_application/bookings/bloc/appointments/appointments_events.dart';
import 'package:beefitmember_application/bookings/bloc/appointments/appointments_state.dart';
import 'package:beefitmember_application/bookings/services/appointments_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentsBloc extends Bloc<AppointmentsEvents, AppointmentsState> {
  AppointmentsService service;

  AppointmentsBloc(AppointmentsState initialState, this.service) : super(initialState);

  @override
  Stream<AppointmentsState> mapEventToState(AppointmentsEvents event) async* {
    if (event is AppointmentsStartEvent) {
      yield AppointmentsInitState();
    }
    if (event is AppointmentsLoadingEvent) {
      yield AppointmentsLoadingState();
      var appointments = await service.getAppointments();
      if (appointments == "error"){
        yield AppointmentsErrorState(message: "Something went wrong!");
      }
      else{
        yield AppointmentsSuccessState(appointments: appointments);
      }
    } else {
      yield AppointmentsErrorState(message: "Bookings error");
    }
  }
}
