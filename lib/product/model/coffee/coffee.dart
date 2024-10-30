import 'package:json_annotation/json_annotation.dart';

part 'coffee.g.dart';

@JsonSerializable()
class Coffee {
  String? name;
  String? aciklama;
  String? fiyat;
  String? raiting;

  Coffee({this.name, this.aciklama, this.fiyat, this.raiting});

  @override
  String toString() {
    return 'Coffee(name: $name, aciklama: $aciklama, fiyat: $fiyat, raiting: $raiting)';
  }

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return _$CoffeeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CoffeeToJson(this);

  Coffee copyWith({
    String? name,
    String? aciklama,
    String? fiyat,
    String? raiting,
  }) {
    return Coffee(
      name: name ?? this.name,
      aciklama: aciklama ?? this.aciklama,
      fiyat: fiyat ?? this.fiyat,
      raiting: raiting ?? this.raiting,
    );
  }
}
