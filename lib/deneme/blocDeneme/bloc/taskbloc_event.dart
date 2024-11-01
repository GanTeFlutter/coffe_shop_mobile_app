part of 'taskbloc_bloc.dart';

abstract class TaskblocEvent extends Equatable {
  const TaskblocEvent();

  @override
  List<Object> get props => [];
}

class TaskAdd extends TaskblocEvent {
  final String task;

  const TaskAdd(this.task);

  @override
  List<Object> get props => [task];
}

class TaskDelete extends TaskblocEvent {
  final String task;

  const TaskDelete(this.task);

  @override
  List<Object> get props => [task];
}

class TaskUpdate extends TaskblocEvent {
  final String task;

  const TaskUpdate(this.task);

  @override
  List<Object> get props => [task];
}

class TaskClear extends TaskblocEvent {}
