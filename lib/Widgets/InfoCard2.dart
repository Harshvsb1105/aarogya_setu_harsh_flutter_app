import 'package:flutter/material.dart';

class InfoCard2 extends StatelessWidget {
  final String text;
  final Image image;
  final String title;

  const InfoCard2({Key key, this.text, this.image, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.23,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff3d81e4),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                text,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
