import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'taskbloc_event.dart';
part 'taskbloc_state.dart';

class TaskblocBloc extends Bloc<TaskblocEvent, TaskblocState> {
  TaskblocBloc() : super(TaskblocInitial()) {
    on<TaskAdd>(_addTask);
    on<TaskDelete>((event, emit) {});
    on<TaskUpdate>((event, emit) {});
    on<TaskClear>((event, emit) {});
  }

  Future<void> _addTask(
    TaskAdd event,
    Emitter<TaskblocState> emit,
  ) async {
    emit(TaskblocLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(TaskblocLoaded([event.task]));
  }
}
