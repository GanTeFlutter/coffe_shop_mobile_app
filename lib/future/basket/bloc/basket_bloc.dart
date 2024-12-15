import 'package:bloc/bloc.dart';
import 'package:coffe_shop_mobile_app/future/basket/model/basaket_model.dart';
import 'package:coffe_shop_mobile_app/future/basket/model/basket_item_model.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:equatable/equatable.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketInitial()) {
    on<AddCoffeeToBasket>(_addCoffeeToBasket);
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
}
