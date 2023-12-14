

// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter_applicationtest/DB/category.dart';

abstract class BlocState extends Equatable{
    @override
  List<Object?> get props => [];
}

class BlocInitial extends BlocState {}

class BlocLoading extends BlocState {}

class BlocError extends BlocState {
  final String message;

  BlocError(this.message);
}

final class BlocFinish extends BlocState {
  final int countCart;
  List<Category> categories;

  BlocFinish({
    required this.countCart,
    required this.categories,
  });

   BlocFinish copyWith({
    int? countCart,
    List<Category>? categories,
  }) {
    return BlocFinish(
      countCart: countCart?? this.countCart,
      categories: categories??this.categories,
    );
  }

    @override
  List<Object?> get props => [countCart, categories,];
}
