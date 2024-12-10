import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coffee.g.dart';

@JsonSerializable()
class Coffee extends Equatable {

  const Coffee({
    this.id,
    this.name,
    this.description,
    this.extra,
    this.image,
    this.price,
    this.rating,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return _$CoffeeFromJson(json);
  }
  final String? id;
  final String? name;
  final String? description;
  final String? extra;
  final String? image;
  final String? price;
  final int? rating;

  Map<String, dynamic> toJson() => _$CoffeeToJson(this);

  Coffee copyWith({
    String? id,
    String? name,
    String? description,
    String? extra,
    String? image,
    String? price,
    int? rating,
  }) {
    return Coffee(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      extra: extra ?? this.extra,
      image: image ?? this.image,
      price: price ?? this.price,
      rating: rating ?? this.rating,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      extra,
      image,
      price,
      rating,
    ];
  }
}
