import 'package:equatable/equatable.dart';

class ThirdPageEvent extends Equatable {
  const ThirdPageEvent();
  @override
  List<Object?> get props => [];
}

class ThirdPageName extends ThirdPageEvent {
  final String name;
  const ThirdPageName({required this.name});
  @override
  List<Object?> get props => [name];
}

class ThirdPageAge extends ThirdPageEvent {
  final String age;
  const ThirdPageAge({required this.age});
  @override
  List<Object?> get props => [age];
}

class ThirdPageOnSubmit extends ThirdPageEvent {}
