import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seab/screens/screenshome/home3.dart';

class Telefone extends StatefulWidget {
  const Telefone({Key? key}) : super(key: key);

  @override
  State<Telefone> createState() => _TelefoneState();
}

class _TelefoneState extends State<Telefone> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _phoneNumber = "+55 31 999087441";
  String _verificationCode = "";
  String _smsCode = "";

  Future<void> _verifyPhoneNumber() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: _phoneNumber, // Substitua pelo número de telefone do usuário
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          };
        },
        codeSent: (String verificationId, int? resendToken) async {
          String smsCode = 'xxxx';
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeThree(verificationId: verificationId),
            ),
          );
          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
          // Sign the user in (or link) with the credential
          await _auth.signInWithCredential(credential);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Tempo limite automático para digitação do código
        },
      );
    } catch (e) {
      print("ERRO ENCONTRADO: ${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(color: Colors.red.withOpacity(0.97), borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Digite seu número de telefone',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            TextField(
              decoration:
                  InputDecoration(fillColor: Colors.grey[100], filled: true),
            ),
            ElevatedButton(onPressed: _verifyPhoneNumber, child: Text('Enviar'))
          ],
        ),
      ),
    );
  }
}
