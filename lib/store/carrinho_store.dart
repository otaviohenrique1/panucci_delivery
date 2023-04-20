import 'package:mobx/mobx.dart';
import 'package:panucci_delivery/models/item.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listaItem = ObservableList<Item>();
  /* ObservableList => Observa se a lista foi modficada */

  @observable
  double totalDaCompra = 0;

  /* @computed observa por mudanças dentro da variável */
  @computed
  int get quantidadeItem => listaItem.length;

  @computed
  bool get listaVazia => listaItem.isEmpty;

  @action
  void adicionaCarrinho(Item item) {
    listaItem.add(item);
    atualizaTotalDaCompra();
  }

  @action
  void removeCarrinho(Item item) {
    listaItem.remove(item);
    atualizaTotalDaCompra();
  }

  @action
  void atualizaTotalDaCompra() {
    totalDaCompra = 0;
    for (var i = 0; i < listaItem.length; i++) {
      totalDaCompra += listaItem[i].preco;
    }
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
