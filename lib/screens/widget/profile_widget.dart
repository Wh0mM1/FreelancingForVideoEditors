import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Center(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Image.network(
                'https://images.unsplash.com/photo-1574717024653-61fd2cf4d44d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dmlkZW8lMjBlZGl0aW5nfGVufDB8fDB8fHww&w=1000&q=80',
                fit: BoxFit.fitWidth,
              ),
            ),
            Align(alignment: Alignment.bottomCenter, child: buildImage()),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    final image = AssetImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 150,
          height: 150,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }
}
