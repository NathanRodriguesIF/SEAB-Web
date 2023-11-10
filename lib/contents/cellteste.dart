import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:seab/main.dart';
import 'package:seab/screens/screenshome/home3.dart';

import '../data/dao.dart';
import '../screens/home.dart';

class Cell extends StatefulWidget {
  const Cell({Key? key}) : super(key: key);

  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> {
  bool _visibility = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _cellController = TextEditingController();
  String _phoneNumber = "";
  String _verificationCode = "";
  String _smsCode = "";
  formatPhoneNumber() {
    String phoneNumber = _cellController.text;

    phoneNumber = phoneNumber.replaceAll(' ', '');
    phoneNumber = phoneNumber.replaceAll('-', '');

    if (phoneNumber.length >= 9) {
      String formattedPhoneNumber =
          '${phoneNumber.substring(0, 5)}-${phoneNumber.substring(5, 9)}';

      _cellController.text = formattedPhoneNumber;
      _phoneNumber = "+55 31 $formattedPhoneNumber";

      print('Número de telefone formatado: $formattedPhoneNumber');
      return formattedPhoneNumber;
    } else {
      // Se o número de telefone for inválido, você pode exibir uma mensagem de erro
      print('Número de telefone inválido');
    }
  }
  Future<void> _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: _phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Autenticação automática bem-sucedida
        // Você pode redirecionar o usuário ou realizar ações necessárias aqui
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Erro de verificação: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
  final dao = Dao();
  Future<void> _signInWithPhone() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationCode,
        smsCode: _smsCode, // O código SMS que o usuário recebe
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final user = userCredential.user;

      await dao.smsIn();
      // Autenticação bem-sucedida
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    } catch (e) {
      print("Erro ao autenticar: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.97),
              borderRadius: BorderRadius.circular(20.0)),
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
                  controller: _cellController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(9), // Limita a 9 dígitos
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Permite apenas dígitos
                  ],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      fillColor: Colors.grey[100], filled: true),
                ),
                ElevatedButton(
                    onPressed: () {
                      formatPhoneNumber();
                      _verifyPhoneNumber();
                      setState(() {
                        _visibility = !_visibility;
                      });
                    },
                    child: Text('Enviar'))
              ],
            ),
          ),
        ),
        Visibility(
          visible: _visibility,
          child: Container(
            width: 350,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.97),
                borderRadius: BorderRadius.circular(20.0)),
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
                  Pinput(
                    length: 6,
                    showCursor: true,
                    defaultPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        textStyle: TextStyle(fontSize: 30)),
                    onCompleted: (value) {
                      setState(() {
                        _smsCode = value;
                      });
                      _signInWithPhone();
                    },
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
