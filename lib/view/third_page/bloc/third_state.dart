import 'package:equatable/equatable.dart';

class ThirdPageState extends Equatable {
  final String name;
  final String age;

  const ThirdPageState({this.name = '', this.age = ''});

  ThirdPageState copyWith({
    String? name,
    String? age,
  }) {
    return ThirdPageState(name: name ?? this.name, age: age ?? this.age);
  }

  @override
  List<Object?> get props => [name, age];
}
