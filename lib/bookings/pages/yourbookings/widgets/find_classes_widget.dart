import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FindClassesWidget extends StatelessWidget {
  const FindClassesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String logoPath = "lib/bookings/pages/yourbookings/assets/picture1.png";

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget> [
          Center(child: ClipRRect(
              child: Image(image: AssetImage(logoPath)),
              borderRadius: BorderRadius.circular(10),
            )
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Text("Find classes that motivates you!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 25),
              child: ElevatedButton(
                  child: Text("Find classes"),
                  onPressed: () {  },
                  style:
                  ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Color.fromRGBO(6, 62, 249, 1),
                      onSurface: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))))
              ),
            ),
            heightFactor: 4,
          ),
        ],
      ),
    );
  }
}