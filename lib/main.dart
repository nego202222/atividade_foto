import 'package:atividade_foto/view/tela_inicio_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:  Center(
          child: TelaInicial(),
        ),
      ),
    );
  }
}