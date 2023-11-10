import 'package:flutter/material.dart';

class PrimeirasOrientacoes extends StatelessWidget {
  const PrimeirasOrientacoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Primeiras Orientações',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
    );
  }
}