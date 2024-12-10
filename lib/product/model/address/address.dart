import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address extends Equatable {
  const Address({
    this.id,
    this.latlong,
    this.name,
    this.description,
    this.note,
    this.status,
    this.ext,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return _$AddressFromJson(json);
  }
  final String? id;
  final String? latlong;
  final String? name;
  final String? description;
  final String? note;
  final String? status;
  final String? ext;

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  Address copyWith({
    String? id,
    String? latlong,
    String? name,
    String? description,
    String? note,
    String? status,
    String? ext,
  }) {
    return Address(
      id: id ?? this.id,
      latlong: latlong ?? this.latlong,
      name: name ?? this.name,
      description: description ?? this.description,
      note: note ?? this.note,
      status: status ?? this.status,
      ext: ext ?? this.ext,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      latlong,
      name,
      description,
      note,
      status,
      ext,
    ];
  }
}
