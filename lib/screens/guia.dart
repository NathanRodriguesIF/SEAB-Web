import 'package:flutter/material.dart';
import 'package:seab/contents/itemguia.dart';
import 'package:seab/screens/screensguia/choque.dart';
import 'package:seab/screens/screensguia/fratura.dart';
import 'package:seab/screens/screensguia/incendio.dart';
import 'package:seab/screens/screensguia/nao_fazer.dart';
import 'package:seab/screens/screensguia/orientacoes_uso.dart';
import 'package:seab/screens/screensguia/parada_cardiaca.dart';
import 'package:seab/screens/screensguia/primeiras_orientacoes.dart';

class Guia extends StatelessWidget {
  const Guia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guia Primeiros Socorros', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ItemGuia(name: 'Orientações de uso', icon: Icons.question_mark, widget: OrientacoesUso(),),
            ),
            ItemGuia(name: 'Primeiras orientações', icon: Icons.warning_amber, widget: PrimeirasOrientacoes(),),
            ItemGuia(name: 'O que não fazer', icon: Icons.warning_amber, widget: NaoFazer(),),
            ItemGuia(name: 'Choques Elétricos', icon: Icons.electric_bolt, widget: Choque(),),
            ItemGuia(name: 'Fraturas ou Luxações', icon: Icons.person, widget: Fratura(),),
            ItemGuia(name: 'Incêndios', icon: Icons.local_fire_department, widget: Incendio(),),
            ItemGuia(name: 'Parada Cardiorespiratória', icon: Icons.heart_broken, widget: ParadaCardiaca(),),
          ],
        ),
      ),
    );
  }
}
