import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seab/contents/formtexttitle.dart';
import 'package:intl/intl.dart';

class Cadastro extends StatefulWidget {
  Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _cellController = TextEditingController();

  Future<void> _register() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passController.text,
      );
      final user = userCredential.user;
      await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
        'nome': _nameController.text,
        'data': _dateController.text,
        'email': _emailController.text,
        'telefone': _cellController.text
        // Adicione outros campos de dados aqui
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Cadastro realizado com sucesso!'),
          duration: Duration(seconds: 2), // Duração da SnackBar
        ),
      );
      await Future.delayed(Duration(seconds: 2));
      print('Cadastro realizado com sucesso: ${userCredential.user!.uid}');
      Navigator.pop(context);
    } catch (e) {
      print('Erro ao cadastrar: $e');
    }
  }

  bool _obscureText = true;

  DateTime? selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Fazer Cadastro',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
              width: 300,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FormTextTitle(icon: Icons.person, name: 'Nome de usuário'),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[100], filled: true),
                  ),
                  FormTextTitle(
                      icon: Icons.date_range, name: 'Data de nascimento'),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: AbsorbPointer(
                      child: TextField(
                        controller: _dateController,
                        decoration: InputDecoration(
                            fillColor: Colors.grey[100], filled: true),
                      ),
                    ),
                  ),
                  FormTextTitle(icon: Icons.email, name: 'Email'),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[100], filled: true),
                  ),
                  FormTextTitle(icon: Icons.password, name: 'Senha'),
                  TextField(
                    obscureText: _obscureText,
                    controller: _passController,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        filled: true,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(_obscureText
                                ? Icons.visibility_off
                                : Icons.visibility))),
                  ),
                  FormTextTitle(icon: Icons.phone, name: 'Telefone'),
                  TextField(
                    controller: _cellController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[100], filled: true),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: ElevatedButton(
                          onPressed: () {
                            _register();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
