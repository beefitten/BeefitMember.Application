import 'package:beefitmember_application/bookings/services/bookings_service.dart';
import 'package:beefitmember_application/shared/user/user.dart';
import 'package:equatable/equatable.dart';

class BookingEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class BookingStartEvent extends BookingEvents {}

class BookingLoadingEvent extends BookingEvents {
  final String email;

  BookingLoadingEvent({required this.email});
}