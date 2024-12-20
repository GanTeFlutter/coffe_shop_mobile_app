// ignore_for_file: unrelated_type_equality_checks

import 'package:bloc/bloc.dart';
import 'package:coffe_shop_mobile_app/future/basket/bloc/basket_operations.dart';
import 'package:coffe_shop_mobile_app/future/basket/model/basaket_model.dart';
import 'package:coffe_shop_mobile_app/future/basket/model/basket_item_model.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:equatable/equatable.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketInitial()) {
    on<AddCoffeeToBasket>(_onAddCoffeeToBasket);
    on<MiktarAzalatma>(_onDecreaseCoffeeQuantity);
  }

  final BaseBasketModel _basket = BaseBasketModel();

  void _onAddCoffeeToBasket(AddCoffeeToBasket event, Emitter<BasketState> emit) {
    try {
      final updatedItems = BasketOperations.updateBasketItems(
        items: List<BasketItemModel>.from(_basket.items),
        coffee: event.coffee,
        quantity: event.miktar,
      );

      _emitUpdatedBasket(updatedItems, emit);
    } catch (e) {
      emit(BasketError(errorMessage: e.toString()));
    }
  }

  void _onDecreaseCoffeeQuantity(MiktarAzalatma event, Emitter<BasketState> emit) {
    try {
      final currentItems = List<BasketItemModel>.from(_basket.items);
      final itemIndex = BasketOperations.findItemIndex(
        currentItems,
        int.parse(event.coffee.id!),
      );

      if (itemIndex != -1) {
        final updatedItems = BasketOperations.decreaseItemQuantity(
          items: currentItems,
          index: itemIndex,
          quantity: event.miktar,
        );

        _emitUpdatedBasket(updatedItems, emit);
      }
    } catch (e) {
      emit(BasketError(errorMessage: e.toString()));
    }
  }

  void _emitUpdatedBasket(List<BasketItemModel> items, Emitter<BasketState> emit) {
    _basket.items = items;
    emit(BasketLoaded(
      basket: _basket,
      toplamAdet: _basket.totalMiktar,
      toplamTutar: _basket.toplamfiyat,
    ),);
  }
}
