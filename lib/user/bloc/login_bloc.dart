import 'package:beefitmember_application/user/bloc/login_events.dart';
import 'package:beefitmember_application/user/bloc/login_state.dart';
import 'package:beefitmember_application/user/service/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBLoc extends Bloc<LoginEvents, LoginState>{
  LoginService service;
  LoginBLoc(LoginState initialState, this.service) : super(initialState);

  @override
  Stream<LoginState> mapEventToState(LoginEvents event) async*{
  var pref = await SharedPreferences.getInstance();
    if(event is StartEvent) {
      yield LoginInitState();
    }
    else if(event is LoginButtonPressed){
      yield LoginLoadingState();
      var data = await service.login(event.email, event.password);

      if(data) {
        pref.setString("token", data['token']);
        pref.setString('email', data['email']);
        yield UserLoginSuccessState();
      }
      else {
        yield LoginErrorState(message: "Login error");
      }
    }


  }
}