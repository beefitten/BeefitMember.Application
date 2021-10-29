import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/user/service/logout_service.dart';
import 'package:flutter/material.dart';

class LogOutBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _logOut = Text(
      'Log out',
      style: TextStyle(
          fontSize: 20.0, color: Color(int.parse(FitnessPackage.model.secondaryColor))),
    );

    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(int.parse(FitnessPackage.model.backgroundColor)))),
      child: _logOut,
      onPressed: () {
        LogoutService.logOut();
        Navigator.pop(context, '/nav');
      },
    );
  }
}