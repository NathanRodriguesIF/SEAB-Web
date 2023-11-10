import 'package:flutter/material.dart';
import 'package:seab/screens/screenshome/home1.dart';
import 'package:seab/screens/screenshome/home2.dart';

import '../data/dao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final dao = Dao();
  bool valorAtual = false;

  Future<void> loadSmsData() async {
    await dao.smsSit();
    valorAtual = dao.resultadoSMS;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadSmsData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(70.0),
              child: AppBar(
                leading: Container(),
                title: const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'SEAB',
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  ),
                ),
                centerTitle: true,
              ),
            ),
            body: valorAtual ? HomeTwo() : HomeOne(),
          );
        } else {
          return Scaffold(body: CircularProgressIndicator());
        }
      },
    );
  }
}
