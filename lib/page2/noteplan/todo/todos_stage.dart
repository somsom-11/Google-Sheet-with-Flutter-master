import 'package:Google_Sheet_with_Flutter/page2/noteplan/model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TodosState extends Equatable {
  TodosState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class TodosLoading extends TodosState {
  @override
  String toString() => 'TodosLoading';
}

class TodosLoaded extends TodosState {
  final List<TodoModel> todos;

  TodosLoaded([this.todos = const []]) : super([todos]);

  @override
  String toString() {
    return 'TodosLoaded { todos : $todos }';
  }

  @override
  List<Object> get props => [todos];
}

class TodosNotLoaded extends TodosState {
  @override
  String toString() => 'TodosNotLoaded';
}
