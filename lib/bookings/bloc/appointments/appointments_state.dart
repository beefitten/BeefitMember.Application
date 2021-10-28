import 'package:beefitmember_application/bookings/pages/yourbookings/models/appointmentModel.dart';
import 'package:equatable/equatable.dart';

class AppointmentsState extends Equatable {
  @override
  List<Object> get props => [];
}

class AppointmentsInitState extends AppointmentsState{}

class AppointmentsLoadingState extends AppointmentsState{}

class AppointmentsSuccessState extends AppointmentsState{
  final List<Appointments> appointments;

  AppointmentsSuccessState({required this.appointments});
}

class AppointmentsErrorState extends AppointmentsState{
  final String message;

  AppointmentsErrorState({required this.message});
}