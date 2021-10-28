import 'package:beefitmember_application/bookings/pages/yourbookings/models/bookingModel.dart';
import 'package:equatable/equatable.dart';

class BookingListState extends Equatable {
  @override
  List<Object> get props => [];
}

class BookingListInitState extends BookingListState{}

class BookingListLoadingState extends BookingListState{}

class BookingListSuccessState extends BookingListState{
  final List<Classes> allBookings;
  final List<Classes> yourBookings;

  BookingListSuccessState({required this.allBookings, required this.yourBookings});
}

class BookingListErrorState extends BookingListState{
  final String message;

  BookingListErrorState({required this.message});
}