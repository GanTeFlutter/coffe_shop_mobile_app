// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:hydrated_bloc/hydrated_bloc.dart';

class CounterCubit extends HydratedBloc<int, int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json['counter'] as int?;
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    return {'counter': state};
  }
}
