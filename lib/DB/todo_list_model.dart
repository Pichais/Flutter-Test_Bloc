 import 'package:equatable/equatable.dart';

class TodoListModel  extends Equatable{
  final String titleName;
  final String detail;

  const TodoListModel({required this.titleName, required this.detail});
  
  @override
  List<Object?> get props => [titleName, detail];
 }