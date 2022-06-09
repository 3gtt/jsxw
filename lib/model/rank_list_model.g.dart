// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankListModel _$RankListModelFromJson(Map<String, dynamic> json) =>
    RankListModel(
      (json['cf_items'] as List<dynamic>)
          .map((e) => Cf_items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RankListModelToJson(RankListModel instance) =>
    <String, dynamic>{
      'cf_items': instance.cfItems,
    };

Cf_items _$Cf_itemsFromJson(Map<String, dynamic> json) => Cf_items(
      json['cf_accessorytype'] as int,
      json['cf_controller_hidebottombar'] as bool,
      json['cf_controller_class'] as String,
      Cf_controller_param.fromJson(
          json['cf_controller_param'] as Map<String, dynamic>),
      json['cf_title'] as String,
      json['cf_icon'] as String,
    );

Map<String, dynamic> _$Cf_itemsToJson(Cf_items instance) => <String, dynamic>{
      'cf_accessorytype': instance.cfAccessorytype,
      'cf_controller_hidebottombar': instance.cfControllerHidebottombar,
      'cf_controller_class': instance.cfControllerClass,
      'cf_controller_param': instance.cfControllerParam,
      'cf_title': instance.cfTitle,
      'cf_icon': instance.cfIcon,
    };

Cf_controller_param _$Cf_controller_paramFromJson(Map<String, dynamic> json) =>
    Cf_controller_param(
      json['maintype'] as String,
      json['title'] as String,
    );

Map<String, dynamic> _$Cf_controller_paramToJson(
        Cf_controller_param instance) =>
    <String, dynamic>{
      'maintype': instance.maintype,
      'title': instance.title,
    };
