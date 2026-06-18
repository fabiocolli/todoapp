import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String nomeDaTarefa;
  final bool tarefaConcluida;
  final Function(bool?)? aoMudar;
  final Function()? aoDeletar;

  const TodoTile({
    super.key,
    required this.nomeDaTarefa,
    required this.tarefaConcluida,
    required this.aoMudar,
    required this.aoDeletar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Checkbox(
              value: tarefaConcluida,
              onChanged: aoMudar,
              activeColor: Colors.deepPurple,
            ),
            Expanded(
              child: Text(
                nomeDaTarefa,
                style: TextStyle(
                  decoration: tarefaConcluida
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
            ),
            IconButton(
              onPressed: aoDeletar,
              icon: const Icon(Icons.delete),
              color: Colors.red[800],
            ),
          ],
        ),
      ),
    );
  }
}
