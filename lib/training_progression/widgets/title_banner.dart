import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/cupertino.dart';

class TitleBanner extends StatelessWidget {
  const TitleBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        child: Center(
          child: TitleText("Weight Goal"),
        ),
      ),
    );
  }
}
