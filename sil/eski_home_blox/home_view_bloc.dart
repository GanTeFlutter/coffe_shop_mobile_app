// import 'package:bloc/bloc.dart';
// import 'package:coffe_shop_mobile_app/product/enums/firebase_enum.dart';
// import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
// import 'package:coffe_shop_mobile_app/product/service/firebase_service.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

// part 'home_view_event.dart';
// part 'home_view_state.dart';

// class HomeViewBloc extends Bloc<HomeViewEvent, HomeViewState> {
//   HomeViewBloc() : super(HomeViewInitial()) {
//     on<LoadHomeView>(_onLoadBloc);
//   }
//   final FirebaseService _firebaseService = FirebaseService();

//   Future<void> _onLoadBloc(
//     LoadHomeView event,
//     Emitter<HomeViewState> emit,
//   ) async {
//     emit(HomeViewLoading());

//     final posts = await _firebaseService.firebaseService(
//       FirebaseDocName.coffee.name,
//       'EspressoBazlıKahveler',
//     );
//     if (posts.isNotEmpty) {
//       emit(HomeViewLoaded(coffeList: posts));
//     } else {
//       emit(HomeViewError('No data available'));
//     }
//   }
// }
