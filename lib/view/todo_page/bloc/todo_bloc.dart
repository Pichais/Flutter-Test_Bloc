import 'dart:async';

import 'package:flutter_applicationtest/DB/todo_list_model.dart';
import 'package:flutter_applicationtest/view/todo_page/bloc/todo_event.dart';
import 'package:flutter_applicationtest/view/todo_page/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(InitailState()) {
    on<LoadingData>(_onLoadingData);
    on<SaveDataTodo>(_onSaveDataTodo);
  }

  FutureOr<void> _onLoadingData(LoadingData event, Emitter<TodoState> emit) async {
    // await Future.delayed(const Duration(seconds: 1));
    emit(ReadyState(todoList: const []));
  }

  FutureOr<void> _onSaveDataTodo(SaveDataTodo event, Emitter<TodoState> emit) async {
    if (state is ReadyState) {
      try {
        ReadyState data = (state as ReadyState);
        List<TodoListModel> newList = List<TodoListModel>.from(data.todoList);
        newList.add(TodoListModel(titleName: event.titlename, detail: event.detail));
        emit(ReadyState(todoList: newList));
      } catch (e) {
        emit(ErrorState(massegeErr: e.toString()));
      }
    }
  }
}
