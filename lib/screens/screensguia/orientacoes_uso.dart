import 'package:flutter/material.dart';

class OrientacoesUso extends StatelessWidget {
  const OrientacoesUso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Orientações de Uso',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                '''O socorrista é uma pessoa capaz de manter a calma em situações de emergência, se tornando responsável por, quando necessário, realizar os primeiros socorros.

É essencial que, em qualquer situação emergencial, a primeira ação seja chamar os bombeiros ou outro serviço de prestação de socorros. Assim, apenas quando extremamente necessário, se deve tentar realizar os primeiros socorros. Caso essa necessidade se apresente e você necessite deste guia, realize todas as orientações à risca e apenas quando se sentir seguro para seguí-las.

Da mesma forma, tenha sempre em mente os 3 princípios dos primeiros socorros: observação da vítima, palpação e diálogo.

Algumas orientações importantes são: mantenha a área isolada, para não desesperar mais ainda a vítima, expulsando os curiosos e nunca ofereça qualquer tipo de bebida, comida ou medicamento antes da chegada dos profissionais.

Em casos de urgência coletiva, com um aglomerado de pessoas, o socorrista deve isolar o local e determinar as prioridades de atendimento pela observação rápida dos acidentados, providenciando o transporte e a ajuda especializada imediatamente.

Da mesma forma, é recomendável ter no carro, em casa e no trabalho uma caixa de primeiros socorros contendo: compressas de gaze, rolos de atadura em tamanhos diferentes, esparadrapo, tesoura de ponta redonda, pinça, soro fisiológico, luvas e lanterna.
''', textAlign: TextAlign.justify,)
          )
        ],
      ),
    );
  }
}
