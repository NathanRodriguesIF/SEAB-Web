import 'package:flutter/material.dart';

class FakeAlerta extends StatelessWidget {
  const FakeAlerta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red.withOpacity(0.5)),
      child: const Text(
        'SOS',
        style: TextStyle(color: Colors.white, fontSize: 40),
      ),
    );
  }
}