import 'package:bloc/bloc.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<FavoriteListFirstEmit>(_listFirstEmitEmpty);
    on<AddFavoriteEvenet>(_addFavorite);
    on<RemoveFavorite>(_removeFavorite);
    on<DeleteAllList>(_deleteAllList);
  }

  final List<Coffee> _favoriteList = [];

  Future<void> _listFirstEmitEmpty(FavoriteListFirstEmit event, Emitter<FavoriteState> emit) async {
    try {
      emit(FavoriteInitial());
    } catch (e) {
      emit(FavoriteErrorState(message: e.toString()));
    }
  }

  Future<void> _addFavorite(AddFavoriteEvenet event, Emitter<FavoriteState> emit) async {
    try {
      _favoriteList.add(event.coffee);
      final newList = List<Coffee>.from(_favoriteList);
      emit(FavoriteLoaded(newList));
      debugPrint('--FavoriteBloc _addFavorite ${event.coffee}');
    } catch (e) {
      emit(FavoriteErrorState(message: e.toString()));
    }
  }

  Future<void> _removeFavorite(RemoveFavorite event, Emitter<FavoriteState> emit) async {
    try {
      if (_favoriteList.contains(event.coffee)) {
        _favoriteList.remove(event.coffee);
        emit(FavoriteLoaded(List.unmodifiable(_favoriteList)));
      } else {
        debugPrint('--FavoriteBloc _removeFavorite: Item not found');
      }
    } catch (e) {
      emit(FavoriteErrorState(message: e.toString()));
    }
  }

  Future<void> _deleteAllList(DeleteAllList event, Emitter<FavoriteState> emit) async {
    try {
      debugPrint('--FavoriteBloc _deleteAllList');
      _favoriteList.clear();
      emit(FavoriteLoaded(_favoriteList));
    } catch (e) {
      emit(FavoriteErrorState(message: e.toString()));
    }
  }
}
