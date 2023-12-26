import 'package:equatable/equatable.dart';
import 'package:flutter_applicationtest/DB/todo_list_model.dart';

class TodoState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitailState extends TodoState {}

class ReadyState extends TodoState {
  final List<TodoListModel> todoList;

  ReadyState({required this.todoList});

  ReadyState copyWith({List<TodoListModel>? todoList}) {
    return ReadyState(
      todoList: todoList?? this.todoList
    );
  }

  @override
  List<Object> get props => [todoList];
}

class ErrorState extends TodoState {
 final String massegeErr;
  ErrorState({required  this.massegeErr});

    @override
  List<Object> get props => [massegeErr];
}
