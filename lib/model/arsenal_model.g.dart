// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arsenal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArsenalModel _$ArsenalModelFromJson(Map<String, dynamic> json) => ArsenalModel(
      Cf_controller_param.fromJson(
          json['cf_controller_param'] as Map<String, dynamic>),
      json['cf_controller_class'] as String,
      json['cf_controller_hidebottombar'] as bool,
      json['title'] as String,
      json['img'] as String,
    );

Map<String, dynamic> _$ArsenalModelToJson(ArsenalModel instance) =>
    <String, dynamic>{
      'cf_controller_param': instance.cfControllerParam,
      'cf_controller_class': instance.cfControllerClass,
      'cf_controller_hidebottombar': instance.cfControllerHidebottombar,
      'title': instance.title,
      'img': instance.img,
    };

Cf_controller_param _$Cf_controller_paramFromJson(Map<String, dynamic> json) =>
    Cf_controller_param(
      json['maintype'] as String?,
      json['country'] as String?,
      json['fileName'] as String?,
      json['title'] as String,
    );

Map<String, dynamic> _$Cf_controller_paramToJson(
        Cf_controller_param instance) =>
    <String, dynamic>{
      'maintype': instance.maintype,
      'country': instance.country,
      'fileName': instance.fileName,
      'title': instance.title,
    };
