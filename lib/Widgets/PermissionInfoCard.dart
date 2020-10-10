import 'package:flutter/material.dart';

class PermissionInfoCard extends StatelessWidget {
  final String title;
  final String description;

  const PermissionInfoCard({Key key, this.title, this.description}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Color(0xff303030),
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 8,),
          Text(
            description,
            textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.grey.shade700
          ),
          ),
        ],
      ),
    );
  }
}
