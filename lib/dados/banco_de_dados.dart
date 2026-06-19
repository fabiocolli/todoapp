import 'package:hive_flutter/hive_flutter.dart';

class BancoDeDadosListaDeTarefas {
  List listaDeTarefas = [];

  final boxTarefas = Hive.box('tarefas');

  void criaDadosIniciais() {
    listaDeTarefas = [
      ["Fazer compras", false],
      ["Estudar Flutter", false],
      ["Lavar o carro", false],
    ];
  }

  void carregarDados() {
    listaDeTarefas = boxTarefas.get('LISTADETAREFAS');
  }

  void atualizarDados() {
    boxTarefas.put('LISTADETAREFAS', listaDeTarefas);
  }
}
