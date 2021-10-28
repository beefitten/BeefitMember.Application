import 'package:beefitmember_application/bookings/services/bookings_service.dart';
import 'package:beefitmember_application/shared/user/user.dart';
import 'package:equatable/equatable.dart';

class AppointmentsEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class AppointmentsStartEvent extends AppointmentsEvents {}

class AppointmentsLoadingEvent extends AppointmentsEvents {}