// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coffee _$CoffeeFromJson(Map<String, dynamic> json) => Coffee(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      extra: json['extra'] as String?,
      image: json['image'] as String?,
      price: json['price'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CoffeeToJson(Coffee instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'extra': instance.extra,
      'image': instance.image,
      'price': instance.price,
      'rating': instance.rating,
    };
