import 'package:equatable/equatable.dart';

class LoginEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends LoginEvents {}

class LoginButtonPressed extends LoginEvents {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}