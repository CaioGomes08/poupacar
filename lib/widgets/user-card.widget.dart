import 'package:flutter/material.dart';
import 'package:poupacar/components/avatar.widget.dart';

class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.9),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(500),
          bottomRight: Radius.circular(500),
        ),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Avatar(
            path: 'https://avatars.githubusercontent.com/u/27794966?v=4',
            width: 80,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Caio Gomes',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Sair',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
