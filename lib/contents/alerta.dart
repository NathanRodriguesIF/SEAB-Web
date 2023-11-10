import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Alerta extends StatelessWidget {
  const Alerta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  backgroundColor: Colors.red,
                  title: const Text(
                    'Deseja ligar para os bombeiros?',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Não',
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        )),
                    TextButton(
                        onPressed: () {
                          FlutterPhoneDirectCaller.callNumber('31999087441');
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Sim',
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ))
                  ],
                  actionsAlignment: MainAxisAlignment.center,
                ));
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text(
        'SOS',
        style: TextStyle(color: Colors.white, fontSize: 40),
      ),
    );
  }
}
