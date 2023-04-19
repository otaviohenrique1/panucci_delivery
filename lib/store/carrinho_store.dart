import 'package:mobx/mobx.dart';
import 'package:panucci_delivery/models/item.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listaItem = ObservableList<Item>();
  /* ObservableList => Observa se a lista foi modficada */

  /* @computed observa por mudanças dentro da variável */
  @computed
  int get quantidadeItem => listaItem.length;

  @computed
  bool get listaVazia => listaItem.isEmpty;

  @action
  void adicionaCarrinho(Item item) {
    listaItem.add(item);
  }

  @action
  void removeCarrinho(Item item) {
    listaItem.remove(item);
  }
}

/*
abstract class _CarrinhoStore with Store {
  @observable
  int quantidadeCarrinho = 0;

  @action
  void adicionaCarrinho() {
    quantidadeCarrinho++;
  }

  @action
  void removeCarrinho() {
    quantidadeCarrinho--;
  }
}
*/
