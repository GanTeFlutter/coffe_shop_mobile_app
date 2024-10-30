// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coffee _$CoffeeFromJson(Map<String, dynamic> json) => Coffee(
      name: json['name'] as String?,
      aciklama: json['aciklama'] as String?,
      fiyat: json['fiyat'] as String?,
      raiting: json['raiting'] as String?,
    );

Map<String, dynamic> _$CoffeeToJson(Coffee instance) => <String, dynamic>{
      'name': instance.name,
      'aciklama': instance.aciklama,
      'fiyat': instance.fiyat,
      'raiting': instance.raiting,
    };
