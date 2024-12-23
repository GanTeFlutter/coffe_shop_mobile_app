// ignore_for_file: prefer_final_locals, unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:coffe_shop_mobile_app/future/basket/model/basaket_model.dart';
import 'package:coffe_shop_mobile_app/future/basket/model/basket_item_model.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:equatable/equatable.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketInitial()) {
    on<AddCoffee>(_addCoffeeToBasket);
    on<MiktarAzalatma>(_miktaraAzalt);
    on<RemoveBasket>(_removeBasket);
  }

  BaseBasketModel _basket = BaseBasketModel();

  void _addCoffeeToBasket(AddCoffee event, Emitter<BasketState> emit) {
    final currentItems = List<BasketItemModel>.from(_basket.items);

    var itemindex = -1;
    //Sepette aynı kahve var mı kontrol et
    for (var i = 0; i < currentItems.length; i++) {
      if (currentItems[i].coffee.id == event.coffee.id) {
        itemindex = i;
        //varsa inswxini al
        break;
      }
    }

    if (itemindex != -1) {
      // Eğer kontrolEtVarMi -1 değilse, yani sepette varsa!!!:
      final eslesenIndex = currentItems[itemindex];
      //sepette eslesen indexi aldik

      //sepet icersindeki eslesen indexi guncelledik daha sonra currentItems listesindeki eslesen indexi guncelledik
      currentItems[itemindex] = eslesenIndex.copyWith(
        miktar: eslesenIndex.miktar + event.miktar,
      );
    } else {
      // Eğer kontrolEtVarMi -1 ise, yani sepette yoksa!!!:
      //sepete yeni bir kahve ekledik
      currentItems.add(
        BasketItemModel(
          coffee: event.coffee,
          miktar: event.miktar,
        ),
      );
    }
    //sepeti guncelledik
    _basket = _basket.copyWith(items: currentItems);
    //sepeti emit ettik
    emit(
      BasketLoaded(
        basket: _basket,
        toplamAdet: _basket.totalMiktar,
        toplamTutar: _basket.toplamfiyat,
      ),
    );
  }

  void _miktaraAzalt(MiktarAzalatma event, Emitter<BasketState> emit) {
    final currentItems = List<BasketItemModel>.from(_basket.items);

    var itemindex = -1;
    for (var i = 0; i < currentItems.length; i++) {
      if (currentItems[i].coffee.id == event.coffee.id) {
        itemindex = i;
        //varsa inswxini al
        break;
      }
    }
    if (itemindex != -1) {
      final eslesenIndex = currentItems[itemindex];

      if (eslesenIndex.miktar > 1) {
        currentItems[itemindex] = eslesenIndex.copyWith(
          miktar: eslesenIndex.miktar + event.miktar,
        );
      } else {
        currentItems.removeAt(itemindex);
      }
    }
    _basket = _basket.copyWith(items: currentItems);
    emit(
      BasketLoaded(
        basket: _basket,
        toplamAdet: _basket.totalMiktar,
        toplamTutar: _basket.toplamfiyat,
      ),
    );
  }

  void _removeBasket(RemoveBasket event, Emitter<BasketState> emit) {
    _basket = BaseBasketModel();
    emit(
      BasketLoaded(
        basket: _basket,
        toplamAdet: _basket.totalMiktar,
        toplamTutar: _basket.toplamfiyat,
      ),
    );
  }
}
