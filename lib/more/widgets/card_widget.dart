import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final double _height;
  final Icon _icon;
  final String _txt;

  CardWidget(this._height, this._icon, this._txt);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: MediaQuery.of(context).size.width * 0.42,
      margin: EdgeInsets.only(
          bottom: 8.0, right: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
          color: Color.fromRGBO(247, 247, 252, 1),
          borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            top: MediaQuery.of(context).size.height * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _icon,
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01),
              child: Text(
                _txt,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
