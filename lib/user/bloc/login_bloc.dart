import 'dart:convert';

import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/user/bloc/login_events.dart';
import 'package:beefitmember_application/user/bloc/login_state.dart';
import 'package:beefitmember_application/user/service/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBLoc extends Bloc<LoginEvents, LoginState> {
  LoginService service;
  LoginBLoc(LoginState initialState, this.service) : super(initialState);

  @override
  Stream<LoginState> mapEventToState(LoginEvents event) async* {
    if (event is StartEvent) {
      yield LoginInitState();
    } else if (event is LoginButtonPressed) {
      yield LoginLoadingState();
      var json = await service.login(event.email, event.password);

      if (json == "error")
        yield LoginErrorState(message: "Fail: Wrong username or password");
      else {
        //saving fitness package properties from token in manager
        FitnessPackage().update(json);
        yield UserLoginSuccessState();
      }
    } else {
      yield LoginErrorState(message: "Login error");
    }
  }
}
