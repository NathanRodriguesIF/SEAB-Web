import 'package:flutter/material.dart';
import 'package:seab/contents/itemmais.dart';
import 'package:seab/screens/screensmore/faq.dart';
import 'package:seab/screens/screensmore/perfil.dart';
import 'package:seab/screens/screensmore/quandochamar.dart';
import 'package:seab/screens/screensmore/quemsomos.dart';
import 'package:seab/screens/screensmore/termos.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Mais opções',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ItemMais(name: 'Perfil', icon: Icons.person, widget: Perfil(),),
            ItemMais(name: 'FAQ', icon: Icons.question_answer, widget: FAQ(),),
            ItemMais(name: 'Termos de uso', icon: Icons.library_books_outlined, widget: TermosUso(),),
            ItemMais(name: 'Quem somos', icon: Icons.person, widget: QuemSomos(),),
            ItemMais(name: 'Quando chamar?', icon: Icons.question_mark, widget: QuandoChamar(),)
          ],
        ),
      ),
    );
  }
}
