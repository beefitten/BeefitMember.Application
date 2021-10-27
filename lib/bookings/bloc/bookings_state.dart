import 'package:beefitmember_application/bookings/pages/yourbookings/models/bookingModel.dart';
import 'package:equatable/equatable.dart';

class BookingsState extends Equatable {
  @override
  List<Object> get props => [];
}

class BookingInitState extends BookingsState{}

class BookingLoadingState extends BookingsState{}

class BookingSuccessState extends BookingsState{
  final List<Classes> bookings;

  BookingSuccessState({required this.bookings});
}

class BookingErrorState extends BookingsState{
  final String message;

  BookingErrorState({required this.message});
}