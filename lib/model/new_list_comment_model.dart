import 'package:json_annotation/json_annotation.dart';

part 'new_list_comment_model.g.dart';


@JsonSerializable()
class NewListCommentModel extends Object {

  @JsonKey(name: 'error')
  int error;

  @JsonKey(name: 'code')
  dynamic code;

  @JsonKey(name: 'code_desc')
  String codeDesc;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'is_login')
  int isLogin;

  @JsonKey(name: 'app_id')
  int appId;

  @JsonKey(name: 'data')
  Data data;

  NewListCommentModel(this.error,this.code,this.codeDesc,this.msg,this.isLogin,this.appId,this.data,);

  factory NewListCommentModel.fromJson(Map<String, dynamic> srcJson) => _$NewListCommentModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewListCommentModelToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'myCommentList')
  List<dynamic> myCommentList;

  @JsonKey(name: 'commentList')
  List<CommentList> commentList;

  @JsonKey(name: 'ADConfig')
  ADConfig aDConfig;

  Data(this.myCommentList,this.commentList,this.aDConfig,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class CommentList extends Object {

  @JsonKey(name: 'commentId')
  String commentId;

  @JsonKey(name: 'newsId')
  String newsId;

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'userId')
  String userId;

  @JsonKey(name: 'userImg')
  String userImg;

  @JsonKey(name: 'vip')
  String vip;

  @JsonKey(name: 'publishTime')
  String publishTime;

  @JsonKey(name: 'dtime')
  String dtime;

  @JsonKey(name: 'laud')
  String laud;

  @JsonKey(name: 'ischeck')
  dynamic ischeck;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'level')
  String level;

  @JsonKey(name: 'militaryRank')
  String militaryRank;

  @JsonKey(name: 'reply_id')
  String replyId;

  @JsonKey(name: 'reply_uid')
  String replyUid;

  @JsonKey(name: 'reply_username')
  String replyUsername;

  @JsonKey(name: 'original_cid')
  String originalCid;

  @JsonKey(name: 'replys_count')
  int replysCount;

  @JsonKey(name: 'replys')
  List<dynamic> replys;

  CommentList(this.commentId,this.newsId,this.userName,this.userId,this.userImg,this.vip,this.publishTime,this.dtime,this.laud,this.ischeck,this.content,this.level,this.militaryRank,this.replyId,this.replyUid,this.replyUsername,this.originalCid,this.replysCount,this.replys,);

  factory CommentList.fromJson(Map<String, dynamic> srcJson) => _$CommentListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommentListToJson(this);

}


@JsonSerializable()
class ADConfig extends Object {

  @JsonKey(name: 'commentAdList')
  List<dynamic> commentAdList;

  ADConfig(this.commentAdList,);

  factory ADConfig.fromJson(Map<String, dynamic> srcJson) => _$ADConfigFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ADConfigToJson(this);

}


