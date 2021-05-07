import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String path;
  final double width;

  Avatar({
    @required this.path,
    @required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width),
        image: DecorationImage(
          image: NetworkImage(path),
        ),
        color: Colors.black.withOpacity(0.2),
        border: Border.all(
          width: 5,
          color: Colors.green.withOpacity(0.8),
        ),
      ),
    );
  }
}
