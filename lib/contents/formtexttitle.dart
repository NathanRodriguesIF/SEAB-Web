import 'package:flutter/material.dart';

class FormTextTitle extends StatelessWidget {
  final IconData icon;
  final String name;
  const FormTextTitle({Key? key, required this.icon, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            name,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
