// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewListModel _$NewListModelFromJson(Map<String, dynamic> json) => NewListModel(
      json['error'] as int,
      json['code'] as int,
      json['code_desc'] as String,
      json['msg'] as String,
      json['is_login'] as int,
      json['app_id'] as int,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewListModelToJson(NewListModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'code': instance.code,
      'code_desc': instance.codeDesc,
      'msg': instance.msg,
      'is_login': instance.isLogin,
      'app_id': instance.appId,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      (json['newsLists'] as List<dynamic>)
          .map((e) => NewsLists.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'newsLists': instance.newsLists,
    };

NewsLists _$NewsListsFromJson(Map<String, dynamic> json) => NewsLists(
      json['id'] as String,
      json['title'] as String,
      json['timeAgo'] as String,
      json['newsAbstract'] as String,
      json['commentNum'],
      json['newsAttribute'] as String,
      json['newsShowType'] as int,
      (json['picList'] as List<dynamic>).map((e) => e as String).toList(),
      (json['tagImgs'] as List<dynamic>).map((e) => e as String).toList(),
      json['is_h5'] as String,
    );

Map<String, dynamic> _$NewsListsToJson(NewsLists instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'timeAgo': instance.timeAgo,
      'newsAbstract': instance.newsAbstract,
      'commentNum': instance.commentNum,
      'newsAttribute': instance.newsAttribute,
      'newsShowType': instance.newsShowType,
      'picList': instance.picList,
      'tagImgs': instance.tagImgs,
      'is_h5': instance.isH5,
    };
