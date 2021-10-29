import 'package:beefitmember_application/shared/widgets/buttons.dart';
import 'package:beefitmember_application/shared/widgets/textfield.dart';
import 'package:beefitmember_application/user/bloc/login_bloc.dart';
import 'package:beefitmember_application/user/bloc/login_events.dart';
import 'package:beefitmember_application/user/bloc/login_state.dart';
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
          padding: const EdgeInsets.only(left: 10, top: 45),
          child: backButton,
        ),
      ],
    );

    final welcomeText = Container(
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                "Please enter your email and password",
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromRGBO(138, 141, 178, 1)
                ),
              )
            ],
          ),
        ],
      ),
    );

    final forgotPassword = Center(
        child: TextButton(
            onPressed: () => {},
            child: TextButton(
                child: Text("Forgot password?"),
                onPressed: () => {loginHand1er()})));

    final msg = BlocBuilder<LoginBLoc, LoginState>(
      builder: (context, state) {
        if (state is LoginErrorState) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 125),
            child: Text(state.message, style: TextStyle(color: Colors.red),
          )));
        } else if (state is LoginLoadingState) {
          return Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: CircularProgressIndicator(),
            ),
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginBLoc, LoginState>(
        listener: (context, state) {
          if (state is UserLoginSuccessState) {
            Navigator.pushReplacementNamed(context, '/nav');
          }
        },
        child: SingleChildScrollView(
          // Avoids pixeloverflow when keyboard opens
          physics: NeverScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // CONTENT HERE
                  headContainer,
                  welcomeText,
                  loginFunc,
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24.0, right: 24.0, top: 10),
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
          ),
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

  void loginHand1er() {
    return loginBLoc.add(
      LoginButtonPressed(
        email: "alex",
        password: "alex", // ;)
      ),
    );
  }
}
