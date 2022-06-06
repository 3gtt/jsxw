// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arsenal_menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArsenalMenuModel _$ArsenalMenuModelFromJson(Map<String, dynamic> json) =>
    ArsenalMenuModel(
      (json['other_country'] as List<dynamic>)
          .map((e) => Other_country.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArsenalMenuModelToJson(ArsenalMenuModel instance) =>
    <String, dynamic>{
      'other_country': instance.otherCountry,
    };

Other_country _$Other_countryFromJson(Map<String, dynamic> json) =>
    Other_country(
      json['title'] as String,
      (json['item'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['isSelect'] as bool? ?? false,
    );

Map<String, dynamic> _$Other_countryToJson(Other_country instance) =>
    <String, dynamic>{
      'title': instance.title,
      'isSelect': instance.isSelect,
      'item': instance.item,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      json['title'] as String,
      json['key'] as String,
      json['value'] as String,
      json['isSelect'] as bool? ?? false,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'title': instance.title,
      'isSelect': instance.isSelect,
      'key': instance.key,
      'value': instance.value,
    };
