import 'package:flutter/material.dart';
import 'package:todoapp/utils/cad_nova_tarefa.dart';
import 'package:todoapp/utils/todo_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controlador = TextEditingController();

  List listaDeTarefas = [
    ["Fazer compras", false],
    ["Estudar Flutter", false],
    ["Lavar o carro", false],
  ];

  void _aoMudar(bool? value, int index) {
    setState(() {
      listaDeTarefas[index][1] = value!;
    });
  }

  void _adicionarTarefa() {
    showDialog(
      context: context,
      builder: (context) => CadNovaTarefa(
        controlador: controlador,
        aoAdicionar: () {
          setState(() {
            listaDeTarefas.add([controlador.text, false]);
          });
          controlador.clear();
          Navigator.of(context).pop();
        },
        aoCancelar: () {
          controlador.clear();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void _aoDeletar(int index) {
    setState(() {
      listaDeTarefas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(widget.title),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: listaDeTarefas.length,
        itemBuilder: (context, index) {
          return TodoTile(
            nomeDaTarefa: listaDeTarefas[index][0],
            tarefaConcluida: listaDeTarefas[index][1],
            aoMudar: (value) => _aoMudar(value, index),
            aoDeletar: () {
              _aoDeletar(index);
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarTarefa,
        tooltip: 'Adicionar Tarefa',
        backgroundColor: Colors.deepPurple[100],
        child: const Icon(Icons.add),
      ),
    );
  }
}
