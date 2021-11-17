import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Text(
          "By continuing you agree to Beefits Terms of Service \n and Privacy Policy",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black38,
            fontSize: MediaQuery.of(context).size.height *
                0.018, //Scales text to screensize. Adjust the integer to adjust size
          ),
        ),
      ),
    );
  }
}
