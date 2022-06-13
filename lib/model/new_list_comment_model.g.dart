// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_list_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewListCommentModel _$NewListCommentModelFromJson(Map<String, dynamic> json) =>
    NewListCommentModel(
      json['error'] as int,
      json['code'],
      json['code_desc'] as String,
      json['msg'] as String,
      json['is_login'] as int,
      json['app_id'] as int,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewListCommentModelToJson(
        NewListCommentModel instance) =>
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
      json['myCommentList'] as List<dynamic>,
      (json['commentList'] as List<dynamic>)
          .map((e) => CommentList.fromJson(e as Map<String, dynamic>))
          .toList(),
      ADConfig.fromJson(json['ADConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'myCommentList': instance.myCommentList,
      'commentList': instance.commentList,
      'ADConfig': instance.aDConfig,
    };

CommentList _$CommentListFromJson(Map<String, dynamic> json) => CommentList(
      json['commentId'] as String,
      json['newsId'] as String,
      json['userName'] as String,
      json['userId'] as String,
      json['userImg'] as String,
      json['vip'] as String,
      json['publishTime'] as String,
      json['dtime'] as String,
      json['laud'] as String,
      json['ischeck'],
      json['content'] as String,
      json['level'] as String,
      json['militaryRank'] as String,
      json['reply_id'] as String,
      json['reply_uid'] as String,
      json['reply_username'] as String,
      json['original_cid'] as String,
      json['replys_count'] as int,
      json['replys'] as List<dynamic>,
    );

Map<String, dynamic> _$CommentListToJson(CommentList instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'newsId': instance.newsId,
      'userName': instance.userName,
      'userId': instance.userId,
      'userImg': instance.userImg,
      'vip': instance.vip,
      'publishTime': instance.publishTime,
      'dtime': instance.dtime,
      'laud': instance.laud,
      'ischeck': instance.ischeck,
      'content': instance.content,
      'level': instance.level,
      'militaryRank': instance.militaryRank,
      'reply_id': instance.replyId,
      'reply_uid': instance.replyUid,
      'reply_username': instance.replyUsername,
      'original_cid': instance.originalCid,
      'replys_count': instance.replysCount,
      'replys': instance.replys,
    };

ADConfig _$ADConfigFromJson(Map<String, dynamic> json) => ADConfig(
      json['commentAdList'] as List<dynamic>,
    );

Map<String, dynamic> _$ADConfigToJson(ADConfig instance) => <String, dynamic>{
      'commentAdList': instance.commentAdList,
    };
