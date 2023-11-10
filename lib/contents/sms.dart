import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class SMS extends StatefulWidget {
  const SMS({Key? key}) : super(key: key);

  @override
  State<SMS> createState() => _SMSState();
}

class _SMSState extends State<SMS> {
  String? smsCode;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                'Digite o PIN recebido por SMS',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Pinput(
              length: 6,
              showCursor: true,
              defaultPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  textStyle: TextStyle(fontSize: 30)),
              onCompleted: (value) {
                setState(() {
                  smsCode = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
