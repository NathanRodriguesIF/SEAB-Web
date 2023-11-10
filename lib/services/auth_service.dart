import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/dao.dart';

class Verificador extends ChangeNotifier {
  final Dao dao = Dao();

  toggleValue() {
    dao.logSit();
    final value = dao.resultado;
    if(value == true){
      dao.logOut();
    } else {
      dao.logIn();
    }
    notifyListeners();
  }
  boolVerify() {
    dao.logSit();
    final resultadoFinal = dao.resultado;
    notifyListeners();
    return resultadoFinal;
  }
  bool get value => boolVerify();

  smsVerify() {
    dao.smsSit();
    final resultadoSMS = dao.resultadoSMS;
    notifyListeners();
    return resultadoSMS;
  }
  bool get valueSMS => smsVerify();
  smsTrue() {
    dao.smsIn();
    final resultadoSMS = dao.resultadoSMS;
    notifyListeners();
    print('Valor resultado SMS: ${resultadoSMS}');
    return resultadoSMS;
  }
  bool get valueSmsTrue => smsTrue();

}

