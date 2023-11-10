import 'dart:async';

import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  const Countdown({Key? key}) : super(key: key);

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  int _countdown = 10;
  bool _isCountingDown = false;

  late Timer _timer;

  void startCountdown() {
    if (_isCountingDown) {
      return;
    }
    setState(() {
      _isCountingDown = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (_countdown > 0) {
          setState(() {
            _countdown--;
          });
        } else {
          _timer.cancel();
          _isCountingDown = false;
        }
      });
    });
  }

  void resetCountdown() {
    if (_isCountingDown) {
      _timer.cancel();
    }
    setState(() {
      _countdown = 10; // Defina o tempo inicial novamente
      _isCountingDown = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
  @override
  void dispose() {
    if (_isCountingDown) {
      _timer.cancel();
    }
    super.dispose();
  }
}
