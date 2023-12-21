import 'package:equatable/equatable.dart';

class TodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingData extends TodoEvent {}

class SaveTitle extends TodoEvent {
  final String titlename;
  SaveTitle({required this.titlename});

  @override
  List<Object?> get props => [titlename];
}

class SaveDetail extends TodoEvent {
  final String detail;
  SaveDetail({required this.detail});
  @override
  List<Object?> get props => [detail];
}

class SaveDataTodo extends TodoEvent {}
