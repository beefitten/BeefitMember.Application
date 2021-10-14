import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingMenuWidget extends StatelessWidget {
  const BookingMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
          "Bookings",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.height * 0.025,
            fontWeight: FontWeight.bold,
          ),
        )),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: <Widget> [
            ElevatedButton(
                  child: Text("Your bookings"),
                  onPressed: () {  },
                  style:
                  ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(95, 46, 234, 1),
                  shape: StadiumBorder())
                  ),
            TextButton(
                  child: Text("Classes"),
                  onPressed: () {  },),
            TextButton(
                child: Text("Events"),
                onPressed: () {  }),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ],
    );
  }
}