import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';


//ter bir ürünün sepetteki miktarını ve topam fiyatını hesaplamak için
class BasketItemModel {
  BasketItemModel({
    required this.coffee,
    required this.miktar,
  });

  final Coffee coffee;
  int miktar;

  double get tekUrunToplamFiyat {
    final temizlenmisFiyat = coffee.price?.replaceAll(' TL', '') ?? '0';
    return miktar * (double.tryParse(temizlenmisFiyat) ?? 0);
  }

  BasketItemModel copyWith({
    Coffee? coffee,
    int? miktar,
  }) {
    return BasketItemModel(
      coffee: coffee ?? this.coffee,
      miktar: miktar ?? this.miktar,
    );
  }
}
