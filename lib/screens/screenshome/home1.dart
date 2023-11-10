import 'package:flutter/material.dart';
import 'package:seab/contents/cellteste.dart';
import 'package:seab/contents/fakealerta.dart';
import 'package:seab/contents/sms.dart';
import 'package:seab/contents/telefone.dart';

class HomeOne extends StatefulWidget {
  const HomeOne({Key? key}) : super(key: key);

  @override
  State<HomeOne> createState() => _HomeOneState();
}

class _HomeOneState extends State<HomeOne> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 28.0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SizedBox(width: 230, height: 230, child: FakeAlerta()),
                  Cell()
                ],
              ),
            ),
            Text(
              'Digite seu telefone para prosseguir',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}