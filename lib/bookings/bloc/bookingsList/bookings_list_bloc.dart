import 'package:beefitmember_application/bookings/services/bookings_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bookings_list_events.dart';
import 'bookings_list_state.dart';

class BookingListBloc extends Bloc<BookingListEvents, BookingListState> {
  BookingsService service;

  BookingListBloc(BookingListState initialState, this.service)
      : super(initialState);

  @override
  Stream<BookingListState> mapEventToState(BookingListEvents event) async* {
    if (event is BookingListStartEvent) {
      yield BookingListInitState();
    }
    if (event is BookingListLoadingEvent) {
      yield BookingListLoadingState();
      var bookings = await service.getAllClasses(event.primaryGym, event.email);
      if (bookings == "error") {
        yield BookingListErrorState(message: "Something went wrong!");
      } else {
        yield BookingListSuccessState(
            yourBookings: bookings[0], allBookings: bookings[1]);
      }
    } else {
      yield BookingListErrorState(message: "Bookings error");
    }
  }
}
