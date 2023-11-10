import 'package:flutter/material.dart';

class TermosUso extends StatelessWidget {
  const TermosUso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Termos de Uso',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 2.0),
        child: Center(
          child: SizedBox(
            width: 350,
            child: ListView(
              children: [Text('Esse aplicativo está apto a coletar dados de login e senha do usuário, a serem utilizados apenas para o uso dos serviços do projeto, assim como a recolher informações de localização do dispositivo. A propaganda de parceiros dentro do aplicativo é permitida e não há nenhum custo para o usuário.\n'
                  'O usuário se compromete a não utilizar o aplicativo para a realização de trotes e brincadeiras, estando sujeito a consequências como multas e limitações de serviços a serem realizadas pela equipe do aplicativo. O uso do botão SOS é apenas para caso de extrema emergência, em que o usuário não tem tempo ou condições de proferir palavras no telefone, de forma que, caso não haja risco de vida, pedimos que o usuário que selecione o botão de ligação convencional, sendo encaminhado diretamente para a linha do corpo de bombeiros. No campo de fórum, o usuário deve ser respeitoso e empático, sujeito a consequências caso não haja de forma a respeitar os direitos humanos e o Marco Civil da Internet.\n'
                  'O usuário se compromete a não realizar as ações do Guia de Primeiros Socorros sob circunstâncias em que não esteja completamente sóbrio. Reforçamos que o Guia deve ser utilizado em situações extraordinárias e caso sejam a única opção. O usuário sempre deve dar preferência para o aguardo de um profissional e, quando necessário, deve seguir todos os passos do guia à risca.\n'
                  'Todas as orientações aqui citadas são para a segurança do próprio usuário e das pessoas ao seu redor, assim como para a garantia do bom funcionamento desse aplicativo. Os termos podem ser alterados, o que, caso ocorra, será notificado ao usuário.', textAlign: TextAlign.justify, style: TextStyle(fontSize: 20),),]
            ),
          ),
        ),
      ),
    );
  }
}
