import 'package:equatable/equatable.dart';
import 'package:flutter_applicationtest/DB/fb_model.dart';

abstract class FbStateBloc extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends FbStateBloc {}

class ReadyState extends FbStateBloc {
  final List<FacebookModel> facebookModel;

  ReadyState({required this.facebookModel});

  ReadyState copyWith({List<FacebookModel>? facebookModel}) {
    return ReadyState(facebookModel: facebookModel ?? this.facebookModel);
  }

  @override
  List<Object?> get props => [facebookModel];
}

class ErrorState extends FbStateBloc {}
