// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';

part 'coffee.g.dart';

@JsonSerializable()

///Coffee model
class Coffee {

  Coffee({this.name, this.aciklama, this.fiyat, this.raiting});

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return _$CoffeeFromJson(json);
  }

  String? name;
  String? aciklama;
  String? fiyat;
  String? raiting;

  @override
  String toString() {
    return 'Coffee(name: $name, aciklama: $aciklama, fiyat: $fiyat, raiting: $raiting)';
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
