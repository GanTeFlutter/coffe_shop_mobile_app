// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: json['id'] as String?,
      latlong: json['latlong'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      note: json['note'] as String?,
      status: json['status'] as String?,
      ext: json['ext'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'latlong': instance.latlong,
      'name': instance.name,
      'description': instance.description,
      'note': instance.note,
      'status': instance.status,
      'ext': instance.ext,
    };
