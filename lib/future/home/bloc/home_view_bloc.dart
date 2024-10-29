import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop_mobile_app/product/model/postmodel/postmodel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_view_event.dart';
part 'home_view_state.dart';

class HomeViewBloc extends Bloc<HomeViewEvent, HomeViewState> {
  HomeViewBloc() : super(HomeViewInitial()) {
    on<LoadHomeView>(_onLoadBloc);
  }
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> _onLoadBloc(
    LoadHomeView event,
    Emitter<HomeViewState> emit,
  ) async {
    emit(HomeViewLoading());
    try {
      final response = await firestore.collection("postModel").get();
      final postModels = response.docs.map((doc) {
        final data = doc.data();
        return Postmodel.fromJson(data);
      }).toList();
      emit(HomeViewLoaded(coffeList: postModels));
    } on FirebaseException catch (error) {
      emit(HomeViewError('Firebase Hatası: ${error.message}'));
    } catch (error) {
      emit(HomeViewError('Beklenmedik bir hata oluştu.'));
    }
  }
}
