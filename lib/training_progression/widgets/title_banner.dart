import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/material.dart';

class TitleBanner extends StatelessWidget {
  final String _title;

  const TitleBanner(this._title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        bottom: 10,
      ),
      child: Container(
        child: Center(
          child: TitleText(_title),
        ),
      ),
    );
  }
}
