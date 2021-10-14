import 'package:flutter/cupertino.dart';

class ImageBox extends StatelessWidget {
  final String _assetPath;

  ImageBox(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image(
        image: NetworkImage(
          _assetPath,
        ),
      ),
    );
  }
}
