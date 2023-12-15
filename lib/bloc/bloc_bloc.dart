import 'dart:async';
import 'package:flutter_applicationtest/DB/category.dart';
import 'package:flutter_applicationtest/bloc/bloc_event.dart';
import 'package:flutter_applicationtest/bloc/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Blocs extends Bloc<BlocEvent, BlocState> {
  static List<Map<String, int>> listStack = [
    {"id": 0, "quantity": 0}
  ];

  Blocs() : super(BlocInitial()) {
    on<loadDataBloc>(_onFetchData);
    on<addToCart>(_onAddToCart);
    on<removeToCart>(_onRemoveToCart);
  }

  void _onFetchData(loadDataBloc event, Emitter<BlocState> emit) async {
    emit(BlocLoading());
    await Future.delayed(const Duration(seconds: 2));
    List<Category> categories = [
      const Category(
        id: 1,
        productName: "สินค้า A",
        price: 100.0,
        quantity: 2,
        imageUrl: "assets/1.png",
      ),
      const Category(
        id: 2,
        productName: "สินค้า B",
        price: 200.0,
        quantity: 5,
        imageUrl: "assets/2.png",
      ),
      const Category(
        id: 3,
        productName: "สินค้า C",
        price: 100.0,
        quantity: 4,
        imageUrl: "assets/3.png",
      ),
      const Category(
        id: 4,
        productName: "สินค้า D",
        price: 200.0,
        quantity: 2,
        imageUrl: "assets/4.png",
      ),
      const Category(
        id: 5,
        productName: "สินค้า E",
        price: 100.0,
        quantity: 1,
        imageUrl: "assets/5.png",
      ),
      const Category(
        id: 6,
        productName: "สินค้า F",
        price: 200.0,
        quantity: 5,
        imageUrl: "assets/6.png",
      ),
      const Category(
        id: 7,
        productName: "สินค้า G",
        price: 1000.0,
        quantity: 1,
        imageUrl: "assets/7.png",
      ),
    ];

    // if(Blocs.listStack.isNotEmpty)Blocs.listStack.clear();

    categories.forEach(
      (element) => Blocs.listStack.add(
        {'id': element.id, 'quantity': element.quantity},
      ),
    );

    emit(BlocFinish(countCart: 0, categories: categories));
  }

  void _onAddToCart(addToCart event, Emitter<BlocState> emit) async {
    if (state is BlocFinish) {
      final int index = event.index;
      final currentState = state as BlocFinish;
      final updatedCategories = List<Category>.from(currentState.categories);
      final int quantity = updatedCategories.elementAt(index).quantity;

      for (var elemet in updatedCategories) {
        if (elemet.id == event.id && quantity > 0) {
          updatedCategories[index] = updatedCategories[index].copyWith(quantity: elemet.quantity - 1);
          final newCount = currentState.countCart + 1;
          emit(
            currentState.copyWith(
              countCart: newCount,
              categories: updatedCategories,
            ),
          );
        }
      }
    }
  }

  void _onRemoveToCart(removeToCart event, Emitter<BlocState> emit) async {
    if (state is BlocFinish) {
      final currentState = state as BlocFinish;

      final updatedCategories = List<Category>.from(currentState.categories);

      final stackValue = Blocs.listStack.where((element) => element['id'] == event.id).toList();

      for (var i = 0; i < updatedCategories.length; i++) {
        var element = updatedCategories[i];
        if (stackValue.first['id'] == element.id) {
          if (currentState.countCart > 0 &&
              element.quantity < stackValue.first['quantity']!.toInt()) {
            updatedCategories[i] = updatedCategories[i].copyWith(quantity: element.quantity + 1);

            final newCount = currentState.countCart - 1;
            emit(
              currentState.copyWith(
                countCart: newCount,
                categories: updatedCategories,
              ),
            );
          }
        }
      }
    }
  }
}


