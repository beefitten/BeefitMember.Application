import 'package:equatable/equatable.dart';

class AppointmentsEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class AppointmentsStartEvent extends AppointmentsEvents {}

class AppointmentsLoadingEvent extends AppointmentsEvents {}
