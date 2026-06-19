import 'package:flutter/material.dart';

class MeuBotao extends StatelessWidget {
  final String texto;
  final VoidCallback aoPressionar;
  const MeuBotao({super.key, required this.texto, required this.aoPressionar});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: aoPressionar,
      color: Colors.deepPurple[100],
      child: Text(texto),
    );
  }
}
