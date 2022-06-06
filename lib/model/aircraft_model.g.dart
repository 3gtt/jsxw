// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aircraft_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AircraftModel _$AircraftModelFromJson(Map<String, dynamic> json) =>
    AircraftModel(
      (json['item'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AircraftModelToJson(AircraftModel instance) =>
    <String, dynamic>{
      'item': instance.item,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      json['title'] as String,
      json['key'] as String?,
      json['value'] as String?,
      json['isSelect'] as bool? ?? false,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'title': instance.title,
      'isSelect': instance.isSelect,
      'key': instance.key,
      'value': instance.value,
    };
