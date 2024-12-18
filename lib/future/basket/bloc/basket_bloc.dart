// ignore_for_file: unrelated_type_equality_checks

import 'package:bloc/bloc.dart';
import 'package:coffe_shop_mobile_app/future/basket/model/basaket_model.dart';
import 'package:coffe_shop_mobile_app/future/basket/model/basket_item_model.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketInitial()) {
    on<AddCoffeeToBasket>(_addCoffeeToBasket);
    on<MiktarAzalatma>(_miktarAzaltma);
  }

  BaseBasketModel _basket = BaseBasketModel();

  void _addCoffeeToBasket(AddCoffeeToBasket event, Emitter<BasketState> emit) {
    final mevcutItemler = List<BasketItemModel>.from(_basket.items);
    final index = mevcutItemler.indexWhere(
      (item) => item.coffee.id == event.coffee.id,
    );
    if (index != -1) {
      mevcutItemler[index] = mevcutItemler[index].copyWith(
        miktar: mevcutItemler[index].miktar + event.miktar,
      );
    } else {
      mevcutItemler.add(
        BasketItemModel(
          coffee: event.coffee,
          miktar: event.miktar,
        ),
      );
    }

    _basket = _basket.copyWith(items: mevcutItemler);

    emit(
      BasketLoaded(
        basket: _basket,
        toplamAdet: _basket.totalMiktar,
        toplamTutar: _basket.toplamfiyat,
      ),
    );
  }

  void _miktarAzaltma(MiktarAzalatma event, Emitter<BasketState> emit) {
    debugPrint('--_miktarAzaltma $event');

    final mevcutItemler = List<BasketItemModel>.from(_basket.items);

    final kontrolEtVarMi = _findItemIndex(mevcutItemler, int.parse(event.coffee.id!));
    if (kontrolEtVarMi != -1) {
      //yani listenin icinde silmek istedigimiz coffe var ise
      final delCoffeeIndex = mevcutItemler[kontrolEtVarMi];

      if (delCoffeeIndex.miktar > 1) {
        //negative dusmemesi icin > kontrol ettik
        mevcutItemler[kontrolEtVarMi] = delCoffeeIndex.copyWith(
          //1 den büyük/biz de kopyasını olusturup miktarını bir azaltıp onun yerine ekledir.
          miktar: delCoffeeIndex.miktar - event.miktar,
        );
      } else {
        //Bu durumda delCoffeeIndex.miktar<1 olduğundan direk listeden sildik
        mevcutItemler.removeAt(kontrolEtVarMi);
      }
    }
    //yeni listeyi ekledik
    _basket = _basket.copyWith(items: mevcutItemler);

    //Sonrasında da emit ettik

    emit(
      BasketLoaded(
        basket: _basket,
        toplamAdet: _basket.totalMiktar,
        toplamTutar: _basket.toplamfiyat,
      ),
    );
  }

  int _findItemIndex(List<BasketItemModel> items, int id) {
    for (var i = 0; i < items.length; i++) {
      if (items[i].coffee.id == id) {
        return i;
      }
    }
    return -1;
  }
}
// miktar: delCoffeeIndex.miktar - event.quantity,
