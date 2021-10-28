import 'package:beefitmember_application/bookings/bloc/bookings_events.dart';
import 'package:beefitmember_application/bookings/bloc/bookings_state.dart';
import 'package:beefitmember_application/bookings/services/bookings_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingBloc extends Bloc<BookingEvents, BookingsState> {
  BookingsService service;

  BookingBloc(BookingsState initialState, this.service) : super(initialState);

  @override
  Stream<BookingsState> mapEventToState(BookingEvents event) async* {
    if (event is BookingStartEvent) {
      yield BookingInitState();
    }
    if (event is BookingLoadingEvent) {
      yield BookingLoadingState();
      var bookings = await service.getBookings(event.email);
      if (bookings == "error"){
        yield BookingErrorState(message: "Something went wrong!");
      }
      else{
        yield BookingSuccessState(bookings: bookings);
      }
    } else {
      yield BookingErrorState(message: "Bookings error");
    }
  }
}
