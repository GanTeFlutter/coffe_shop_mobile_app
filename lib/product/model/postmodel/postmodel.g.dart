// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Postmodel _$PostmodelFromJson(Map<String, dynamic> json) => Postmodel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      price: json['price'] as String?,
      description: json['description'] as String?,
      raiting: json['raiting'] as String?,
    );

Map<String, dynamic> _$PostmodelToJson(Postmodel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'description': instance.description,
      'raiting': instance.raiting,
    };
