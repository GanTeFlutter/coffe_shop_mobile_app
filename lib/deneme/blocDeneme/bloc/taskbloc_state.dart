part of 'taskbloc_bloc.dart';

abstract class TaskblocState extends Equatable {
  const TaskblocState();
  
  @override
  List<Object> get props => [];
}

class TaskblocInitial extends TaskblocState {}
