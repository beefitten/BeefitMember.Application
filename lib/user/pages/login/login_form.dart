import 'package:beefitmember_application/shared/widgets/buttons.dart';
import 'package:beefitmember_application/shared/widgets/textfield.dart';
import 'package:beefitmember_application/user/bloc/login_bloc.dart';
import 'package:beefitmember_application/user/bloc/login_events.dart';
import 'package:beefitmember_application/user/bloc/login_state.dart';
import 'package:beefitmember_application/user/pages/login/widgets/login_input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  late LoginBLoc loginBLoc;
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final String logoPath = "lib/shared/assets/images/logo.svg";

  @override
  void initState() {
    loginBLoc = BlocProvider.of<LoginBLoc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final logo = Center(
        child: SvgPicture.asset(
      logoPath,
    ));

    final backButton = RawMaterialButton(
      onPressed: () {
        Navigator.pop(context, '/');
      },
      elevation: 3.0,
      fillColor: Colors.white,
      child: Icon(
        Icons.arrow_back,
        size: 25.0,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );

    final headContainer = Stack(
      children: [
        Container(
          child: logo,
          height: MediaQuery.of(context).size.height * 0.3,
          color: Color.fromRGBO(242, 245, 255, 1),
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.03),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 20),
          child: backButton,
        ),
      ],
    );

    final welcomeText = Container(
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            "Please enter your email and password",
            style: TextStyle(
                fontSize: 13, color: Color.fromRGBO(138, 141, 178, 1)),
          )
        ],
      ),
    );

    final forgotPassword = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(onPressed: () {}, child: Text("Forgot password?")),
        ],
      ),
    );

    final msg = BlocBuilder<LoginBLoc, LoginState>(
      builder: (context, state) {
        if (state is LoginErrorState) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 125),
            child: Text(state.message, style: TextStyle(color: Colors.red)),
          ));
        } else if (state is LoginLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
    );

    final emailInput = Container(
        padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 10),
        child: Column(
          children: [
            TextFieldInput(
                email,
                false,
                true,
                247,
                247,
                252,
                1,
                0xFF666666,
                'Email',
                20.0,
                10.0,
                20.0,
                10.0,
                5.0,
                TextInputType.emailAddress),
          ],
        ));

    final passwordInput = Container(
      padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 10),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextField(
            controller: password,
            autofocus: false,
            obscureText: _obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(247, 247, 252, 1),
              hintStyle: TextStyle(color: Color(0xFF666666)),
              hintText: 'Password',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: _toggleObscureText,
              child:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            ),
          ),
        ],
      ),
    );

    final loginForm = Column(
      children: [
        emailInput,
        passwordInput,
      ],
    );

    final loginFunc = Stack(
      children: [
        loginForm,
        msg,
      ],
    );

    final loginButton = Padding(
      padding: EdgeInsets.fromLTRB(24.0, 10, 16.0, 0),
      // ignore: deprecated_member_use
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: () {
          loginBLoc.add(
              LoginButtonPressed(email: email.text, password: password.text));
        },
        padding: EdgeInsets.all(15),
        color: Color.fromRGBO(6, 62, 249, 1),
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginBLoc, LoginState>(
        listener: (context, state) {
          if (state is UserLoginSuccessState) {
            Navigator.pushNamed(context, '/nav');
          }
        },
        child: Column(
          // shrinkWrap: true,
          children: <Widget>[
            headContainer,
            welcomeText,
            loginFunc,
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton("Login", () => {loginHandler()}),
                  ),
                ],
              ),
            ),
            forgotPassword,
          ],
        ),
      ),
    );
  }

  void loginHandler() {
    return loginBLoc.add(
      LoginButtonPressed(
        email: email.text,
        password: password.text,
      ),
    );
  }
}
