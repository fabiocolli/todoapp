import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/dados/banco_de_dados.dart';
import 'package:todoapp/utils/cad_nova_tarefa.dart';
import 'package:todoapp/utils/todo_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final boxTarefas = Hive.box('tarefas');

  BancoDeDadosListaDeTarefas bd = BancoDeDadosListaDeTarefas();

  void atualizaDados() {
    bd.atualizarDados();
  }

  @override
  void initState() {
    if (boxTarefas.get('LISTADETAREFAS') == null) {
      bd.criaDadosIniciais();
    } else {
      bd.carregarDados();
    }
    super.initState();
  }

  final controlador = TextEditingController();

  void _aoMudar(bool? value, int index) {
    setState(() {
      bd.listaDeTarefas[index][1] = value!;
      atualizaDados();
    });
  }

  void _adicionarTarefa() {
    showDialog(
      context: context,
      builder: (context) => CadNovaTarefa(
        controlador: controlador,
        aoAdicionar: () {
          setState(() {
            bd.listaDeTarefas.add([controlador.text, false]);
            atualizaDados();
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
      bd.listaDeTarefas.removeAt(index);
      atualizaDados();
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
        itemCount: bd.listaDeTarefas.length,
        itemBuilder: (context, index) {
          return TodoTile(
            nomeDaTarefa: bd.listaDeTarefas[index][0],
            tarefaConcluida: bd.listaDeTarefas[index][1],
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
