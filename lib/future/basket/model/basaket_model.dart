import 'package:coffe_shop_mobile_app/future/basket/model/basket_item_model.dart';

class BaseBasketModel {
  BaseBasketModel({this.items = const []});

  List<BasketItemModel> items;

  //Listenin icindeki urunlerin toplam fiyatini hesaplamak icin listenin icindeki tum tekUrunToplamFiyat toplamini alir
  double get toplamfiyat => items.fold(0, (sum, item) => sum + item.tekUrunToplamFiyat);

  int get totalMiktar => items.fold(0, (sum, item) => sum + item.miktar);

  BaseBasketModel copyWith({
    List<BasketItemModel>? items,
  }) {
    return BaseBasketModel(
      items: items ?? this.items,
    );
  }
}
