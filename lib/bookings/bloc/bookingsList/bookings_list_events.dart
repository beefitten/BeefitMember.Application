import 'package:beefitmember_application/bookings/services/bookings_service.dart';
import 'package:beefitmember_application/shared/user/user.dart';
import 'package:equatable/equatable.dart';

class BookingListEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class BookingListStartEvent extends BookingListEvents {}

class BookingListLoadingEvent extends BookingListEvents {
  final String email;
  final String primaryGym;

  BookingListLoadingEvent({required this.primaryGym, required this.email});
}