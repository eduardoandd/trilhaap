import '../model/tarefa.dart';

class TarefaRepository{

  final List<Tarefa> _tarefas = [];

  Future<void> adicionar(Tarefa tarefa) async{
    await Future.delayed(const Duration(microseconds: 50));
    _tarefas.add(tarefa);
  }

  // RETORNA TODAS AS TAREFAS
  Future<List<Tarefa>> getTarefas() async{
    await Future.delayed(const Duration(microseconds: 50)); // espera 1 segundo antes de passsa para próxima linha
    return _tarefas;
  }

  Future<List<Tarefa>> getTarefasNaoConcluidas() async{
    await Future.delayed(const Duration(microseconds: 50)); // espera 1 segundo antes de passsa para próxima linha
    return _tarefas.where((tarefa) => !tarefa.concluido).toList();
  }

  Future<void>  alterar(String id, bool concluido) async {
    await Future.delayed(const Duration(microseconds: 50));

    _tarefas
      .where((tarefa) => tarefa.id == id)
      .first
      .concluido = concluido;
  }
  Future<void> remove(String id) async {
    await Future.delayed(const Duration(microseconds: 50));
    _tarefas.remove(_tarefas.where((tarefa) => tarefa.id == id).first);

  }

}