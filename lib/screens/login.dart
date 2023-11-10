import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seab/data/dao.dart';
import 'package:seab/main.dart';
import 'package:seab/screens/cadastro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seab/services/auth_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  Future<Map<String, dynamic>?> getUserData(String userUUID) async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userUUID)
          .get();

      if (userSnapshot.exists) {
        // O usuário com o UID especificado foi encontrado
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;

        // Agora você pode acessar os campos de dados do usuário, por exemplo:
        String username = userData['nome'];
        String date = userData['data'];
        String email = userData['email'];
        String phone = userData['telefone'];

        Dao().save(username, date, email, phone);
      } else {
        // O usuário não foi encontrado
        print('Usuário não encontrado');
      }
    } catch (e) {
      print('Erro ao buscar dados do usuário: $e');
      return null;
    }
  }

  Future<void> _signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passController.text,
      );
      Verificador value = Provider.of<Verificador>(context, listen: false);
      value.toggleValue();
      print(value.boolVerify());

      String userUID = userCredential.user?.uid ?? '';
      print('UserUID');
      print(userUID);
      getUserData(userUID);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login bem-sucedido!'),
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
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          print('Usuário não encontrado');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Usuário não encontrado!'),
              duration: Duration(seconds: 3), // Duração da SnackBar
            ),
          );
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Senha incorreta!'),
              duration: Duration(seconds: 3), // Duração da SnackBar
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erro ao fazer Login'),
              duration: Duration(seconds: 3), // Duração da SnackBar
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao fazer Login'),
            duration: Duration(seconds: 3), // Duração da SnackBar
          ),
        );
      }
      print(e.toString());
    }
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Row(
                children: [
                  Icon(Icons.email),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Email',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: _emailController,
                decoration:
                    InputDecoration(fillColor: Colors.grey[100], filled: true),
              ),
              const Row(
                children: [
                  Icon(Icons.password),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Senha',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              TextField(
                obscureText: _obscureText,
                controller: _passController,
                decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    }, icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility))),
              ),
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: _signIn,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cadastro()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          child: const Text(
                            'Fazer Cadastro',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
