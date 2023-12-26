import 'package:equatable/equatable.dart';

class TodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingData extends TodoEvent {}


class SaveDataTodo extends TodoEvent {
    final String titlename;
  final String detail;

    SaveDataTodo({required this.detail,required this.titlename});
  @override
  List<Object?> get props => [titlename,detail];
}
