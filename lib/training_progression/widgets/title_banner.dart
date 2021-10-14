import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/cupertino.dart';

class TitleBanner extends StatelessWidget {
  final String _title;

  const TitleBanner(this._title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, bottom: 20),
      child: Container(
        child: Center(
          child: TitleText(_title),
        ),
      ),
    );
  }
}
