import 'package:beefitmember_application/shared/user/user.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.4,
            top: MediaQuery.of(context).size.height * 0.01),
        child: Column(
          children: [
            CircleAvatar(
                radius: 45, backgroundImage: NetworkImage(User.profileImage)),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: Column(
                children: [
                  Text(User.name),
                  Text(
                    User.role,
                    style: TextStyle(color: Color.fromRGBO(138, 141, 178, 1)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
