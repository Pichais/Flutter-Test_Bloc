
// ignore_for_file: camel_case_types

abstract class BlocEvent{}

class loadDataBloc extends BlocEvent{}


class addToCart extends BlocEvent{
  final int index;
  final int id;

  addToCart(this.index, this.id);
}

class removeToCart extends BlocEvent{
    final int index;
    final int id;

  removeToCart(this.index, this.id);
}