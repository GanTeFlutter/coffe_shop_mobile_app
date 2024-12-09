import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(_debugDeneme);
  }
  void _debugDeneme(HomeInitialEvent event, Emitter<HomeState> emit) {
    debugPrint('--HomeBloc: ${event.message}');
  }
}
