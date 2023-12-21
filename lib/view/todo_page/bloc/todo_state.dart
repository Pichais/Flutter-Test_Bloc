import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitailState extends TodoState {}

class ReadyState extends TodoState {
  final String tilename;
  final String detail;

  ReadyState({this.tilename = '', this.detail = ''});

  ReadyState copyWith({String? tilename, String? detail}) {
    return ReadyState(
      tilename: tilename ?? this.tilename,
      detail: detail ?? this.detail,
    );
  }

  @override
  List<Object> get props => [tilename, detail];
}

class ErrorState extends TodoState {}
