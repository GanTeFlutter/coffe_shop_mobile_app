import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'taskbloc_event.dart';
part 'taskbloc_state.dart';

class TaskblocBloc extends Bloc<TaskblocEvent, TaskblocState> {
  TaskblocBloc() : super(TaskblocInitial());

  @override
  Stream<TaskblocState> mapEventToState(
    TaskblocEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
