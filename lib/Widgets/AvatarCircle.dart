import 'package:flutter/material.dart';

class AvatarCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100)
      ),
      child: CircleAvatar(
        radius: 70,
        backgroundImage: AssetImage('images/img5.jpg'),
        ),
      );
  }
}
