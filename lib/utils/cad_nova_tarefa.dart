import 'package:flutter/material.dart';
import 'package:todoapp/utils/meu_botao.dart';

class CadNovaTarefa extends StatelessWidget {
  final TextEditingController controlador;
  final VoidCallback aoAdicionar;
  final VoidCallback aoCancelar;

  const CadNovaTarefa({
    super.key,
    required this.controlador,
    required this.aoAdicionar,
    required this.aoCancelar,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controlador,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome da Tarefa',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    spacing: 10,
                    children: [
                      MeuBotao(texto: 'Adicionar', aoPressionar: aoAdicionar),
                      MeuBotao(texto: 'Cancelar', aoPressionar: aoCancelar),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
