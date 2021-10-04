import 'package:beefitmember_application/user/bloc/login_bloc.dart';
import 'package:beefitmember_application/user/bloc/login_events.dart';
import 'package:beefitmember_application/user/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Login extends StatefulWidget{
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  late LoginBLoc loginBLoc;

  @override
  void initState() {
    loginBLoc = BlocProvider.of<LoginBLoc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    final logo = Center(
      child: Icon(Icons.supervised_user_circle, size: 150, color: Colors.lightBlue,),
    );

    final msg = BlocBuilder<LoginBLoc, LoginState>(
      builder: (context, state) {
        if(state is LoginErrorState){
          return Text(state.message);
        }
        else if (state is LoginLoadingState){
          return Center(child: CircularProgressIndicator(),);
        }

        return Container();
      },
    );

    final username = TextField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        filled: true,
        fillColor: Color(0xFFF2F3F5),
        hintStyle: TextStyle(
          color: Color(0xFF666666)
        ),
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
      ),
    );

    final pass = TextField(
      controller: password,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          filled: true,
          fillColor: Color(0xFFF2F3F5),
          hintStyle: TextStyle(
              color: Color(0xFF666666)
          ),
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
      ),
    );

    final loginButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          loginBLoc.add(LoginButtonPressed(email: email.text, password: password.text));
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Login', style: TextStyle(color: Colors.white),),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginBLoc, LoginState>(
        listener: (context, state){
          if(state is UserLoginSuccessState){
           Navigator.pushNamed(context, '/contact');
          }
        },
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            msg,
            SizedBox(height: 20.0),
            username,
            SizedBox(height: 20.0),
            pass,
            SizedBox(height: 20.0),
            loginButton
          ],
        ),
      ),
    );

  }
}

/*
class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextFieldInput('Username', 200.0), TextFieldInput('Password', 200.0)
        ],
      ),
    );
  }
}*/


