import 'package:bloc/bloc.dart';
import 'package:coffe_shop_mobile_app/future/home/model/home_kategory_state.dart';
import 'package:coffe_shop_mobile_app/product/enums/e.firebase.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:coffe_shop_mobile_app/product/service/firebase_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeKategoryEvent>(_debugDeneme);
  }

  final _firebaseService = FirebaseService();
  Future<void> _debugDeneme(HomeKategoryEvent event, Emitter<HomeState> emit) async {
    debugPrint('--HomeBloc: ${event.message}');

    try {
      final responseFire = await _firebaseService.fetchCoffee(
        collectionName: FirebaseCollDocName.coffee.name,
        fromJson: Coffee.fromJson,
        docName: event.message,
      );
      debugPrint('--HomeBloc: responseFire: $responseFire');
      emit(HomeLoaded2(listCoffee: responseFire));
    } catch (e) {
      debugPrint('--HomeBloc: $e');
      emit(HomeErrorState(message: e.toString()));
    }
  }
}
