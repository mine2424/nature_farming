// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:nature_farming/views/widget/appBar/appBar.dart';
import 'package:photo_view/photo_view.dart';

class BoardDetailsImage extends StatelessWidget {
  const BoardDetailsImage({Key key, this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(context, '画像', true),
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 20,
              child: FlatButton(
                hoverColor: Colors.white,
                onPressed: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                child: PhotoView(
                  enableRotation: true,
                  maxScale: PhotoViewComputedScale.covered * 3.5,
                  imageProvider: NetworkImage(image),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
