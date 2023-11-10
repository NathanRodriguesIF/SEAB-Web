import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seab/contents/fakealerta.dart';
import 'package:seab/contents/sms.dart';
import 'package:seab/contents/telefone.dart';
import 'package:seab/screens/screenshome/home1.dart';
import 'package:seab/screens/screenshome/home2.dart';

class HomeThree extends StatefulWidget {
  final String verificationId;
  const HomeThree({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<HomeThree> createState() => _HomeThreeState();
}

class _HomeThreeState extends State<HomeThree> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationCode = "";

  Future<void> _signInWithPhone() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationCode,
        smsCode: "123456", // O código SMS que o usuário recebe
      );

      final userCredential = await _auth.signInWithCredential(credential);

      final user = userCredential.user;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeTwo(),
        ),
      );

      // Autenticação bem-sucedida
      // Você pode redirecionar o usuário ou realizar ações necessárias aqui
    } catch (e) {
      print("Erro ao autenticar: $e");
    }
  }


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
                  SMS()
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