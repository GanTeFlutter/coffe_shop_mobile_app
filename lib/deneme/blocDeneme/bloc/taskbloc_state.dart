part of 'taskbloc_bloc.dart';

abstract class TaskblocState extends Equatable {
  const TaskblocState();
  
  @override
  List<Object> get props => [];
}

class TaskblocInitial extends TaskblocState {}

class TaskblocLoading extends TaskblocState {}

class TaskblocLoaded extends TaskblocState {
  final List<String> tasks;

  const TaskblocLoaded(this.tasks);

  @override
  List<Object> get props => [tasks];
}
