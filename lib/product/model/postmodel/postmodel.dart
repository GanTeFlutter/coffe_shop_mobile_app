import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'postmodel.g.dart';

@JsonSerializable()
class Postmodel extends Equatable {

  const Postmodel({
    this.id,
    this.name,
    this.image,
    this.price,
    this.description,
    this.raiting,
  });

  factory Postmodel.fromJson(Map<String, dynamic> json) {
    return _$PostmodelFromJson(json);
  }
  final String? id;
  final String? name;
  final String? image;
  final String? price;
  final String? description;
  final String? raiting;

  Map<String, dynamic> toJson() => _$PostmodelToJson(this);

  Postmodel copyWith({
    String? id,
    String? name,
    String? image,
    String? price,
    String? description,
    String? raiting,
  }) {
    return Postmodel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      description: description ?? this.description,
      raiting: raiting ?? this.raiting,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      image,
      price,
      description,
      raiting,
    ];
  }
}
