import 'package:flutter/material.dart';

class ParadaCardiaca extends StatelessWidget {
  const ParadaCardiaca({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Parada Cardiorespiratória',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        Text(
          '''* Verifique se a vítima está consciente. Se não estiver, peça ajuda especializada (médico, ambulância etc.) imediatamente;
* Posicione a vítima de barriga para cima em uma superfície rígida e plana;
* Avalie as vias aéreas, inspecionando e desobstruindo a boca;
* Verifique se a vítima está respirando; se não estiver, faça a respiração boca a boca (duas ventilações com intervalo), usando o dispositivo de proteção. Caso não dispõe de proteção, passa direto para as compressões no tórax (100 vezes por minuto, sem intervalos);
* Verifique a cada minuto se a vítima voltou a respirar e a ter pulso;''',
          textAlign: TextAlign.justify, style: TextStyle(fontSize: 18),),
      ),
    );
  }
}