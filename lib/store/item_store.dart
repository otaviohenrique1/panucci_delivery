import 'package:mobx/mobx.dart';

part 'item_store.g.dart';

class ItemStore = _ItemStore with _$ItemStore;

abstract class _ItemStore with Store {
  @observable
  int valorContador = 0;

  @action
  void adicionaItem() {
    valorContador++;
  }

  @action
  void removerItem() {
    valorContador--;
  }
}

/*
  @observable => Indica que uma variável de uma classe deve ser observada
  @action => Utilizada para marcar um método que modifica o estado da aplicação
*/