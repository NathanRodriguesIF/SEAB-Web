import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'FAQ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          child: Text(
            'Essa aba ainda está sendo desenvolvida pelos criadores. Sempre procuramos aprimorar o aplicativo para a melhor experiência de nosso cliente.\nA ideia dessa página é apresentar perguntas frequentes realizadas aos bombeiros e suas respectivas respostas',
            style: TextStyle(fontSize: 20), textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
