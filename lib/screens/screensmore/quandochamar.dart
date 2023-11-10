import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/dao.dart';
import '../../services/auth_service.dart';

class QuandoChamar extends StatefulWidget {
  const QuandoChamar({Key? key}) : super(key: key);

  @override
  State<QuandoChamar> createState() => _QuandoChamarState();
}

class _QuandoChamarState extends State<QuandoChamar> {
  Future<void> _res() async {
    Verificador valueSMS = Provider.of<Verificador>(context, listen: false);
    await valueSMS.smsTrue();
    await valueSMS.smsVerify();
    print(valueSMS.smsVerify());
  }

  final dao = Dao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Quando Chamar',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: ElevatedButton(onPressed: (){dao.smsOut();}, child: Text('Telefone')),
    );
  }
}
