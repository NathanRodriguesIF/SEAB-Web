import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seab/data/dao.dart';

import '../../main.dart';
import '../../services/auth_service.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  Future<void> _signOut() async {
    Verificador value = Provider.of<Verificador>(context, listen: false);
    value.toggleValue();
    print(value.boolVerify());
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Saindo do Perfil'),
        duration: Duration(seconds: 2), // Duração da SnackBar
      ),
    );
    await Future.delayed(Duration(seconds: 2));
    // Login bem-sucedido, você pode navegar para outra tela aqui
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const MyApp(),
      ),
    );
    await dao.delete();
  }

  final dao = Dao();
  final verificar = Verificador();

  String userName = '';
  String userEmail = '';
  String userDate = '';
  String userPhone = '';

  Future<void> loadUserData() async {
    final userData = await dao.read();
    if (userData.isNotEmpty) {
      // Assuming the first row in the database contains the user data
      final user = userData.first;
      userName = user['Nome'];
      userEmail = user['Email'];
      userDate = user['Data'];
      userPhone = user['Telefone'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.white,
              title: Text(
                'Perfil',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
              centerTitle: true,
            ),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      color: Colors.redAccent,
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Nome: ${userName}',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Text('Email: ${userEmail}',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))
                          ],
                        ),
                      )),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Data de nascimento',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(Icons.calendar_month)
                              ],
                            ),
                            Text('${userDate}', style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Telefone',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Icon(Icons.phone)
                                ],
                              ),
                              Text(
                                '${userPhone}',
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                        onPressed: _signOut,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          foregroundColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            Text('Sair', style: TextStyle(color: Colors.white)),
                            Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        )),
                  )
                ],
              ),
            ),
          );
        } else {
          return Scaffold(body: CircularProgressIndicator());
        }
      },
    );
  }
}
