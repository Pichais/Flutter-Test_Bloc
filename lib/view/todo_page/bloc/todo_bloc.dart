import 'dart:async';

import 'package:flutter_applicationtest/view/todo_page/bloc/todo_event.dart';
import 'package:flutter_applicationtest/view/todo_page/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(InitailState()) {
    on<LoadingData>(_onLoadingData);
    on<SaveDataTodo>(_onSaveDataTodo);
    on<SaveTitle>(_onSaveTitle);
    on<SaveDetail>(_onSaveDetail);
  }

  FutureOr<void> _onLoadingData(LoadingData event, Emitter<TodoState> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(ReadyState());
  }

  FutureOr<void> _onSaveTitle(SaveTitle event, Emitter<TodoState> emit) {
     if (state is ReadyState) {
     emit((state as ReadyState).copyWith(tilename: event.titlename));
    }
  }

  FutureOr<void> _onSaveDetail(SaveDetail event, Emitter<TodoState> emit) {
     if (state is ReadyState) {
     if (state is ReadyState) {
     emit((state as ReadyState).copyWith(detail: event.detail));
    }
    }
  }

  FutureOr<void> _onSaveDataTodo(SaveDataTodo event, Emitter<TodoState> emit) {
    if (state is ReadyState) {
      ReadyState data = state as ReadyState;
      print('title = ${data.tilename}');
      print('detail = ${data.detail}');
    }
  }
}
