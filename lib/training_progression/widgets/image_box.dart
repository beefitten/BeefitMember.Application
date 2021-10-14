import 'package:flutter/cupertino.dart';

class ImageBox extends StatelessWidget {
  final String _assetPath;

  ImageBox(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image(
          image: NetworkImage(
            _assetPath,
          ),
        ),
      ),
    );
  }
}
