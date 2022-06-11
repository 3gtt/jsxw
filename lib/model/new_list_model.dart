import 'package:json_annotation/json_annotation.dart';

part 'new_list_model.g.dart';


@JsonSerializable()
class NewListModel extends Object {

  @JsonKey(name: 'error')
  int error;

  @JsonKey(name: 'code')
  int code;

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

  NewListModel(this.error,this.code,this.codeDesc,this.msg,this.isLogin,this.appId,this.data,);

  factory NewListModel.fromJson(Map<String, dynamic> srcJson) => _$NewListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewListModelToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'newsLists')
  List<NewsLists> newsLists;

  Data(this.newsLists,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class NewsLists extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'timeAgo')
  String timeAgo;

  @JsonKey(name: 'newsAbstract')
  String newsAbstract;

  @JsonKey(name: 'commentNum')
  String? commentNum;

  @JsonKey(name: 'newsAttribute')
  String newsAttribute;

  @JsonKey(name: 'newsShowType')
  int newsShowType;

  @JsonKey(name: 'picList')
  List<String> picList;

  @JsonKey(name: 'tagImgs')
  List<String> tagImgs;

  @JsonKey(name: 'is_h5')
  String isH5;

  NewsLists(this.id,this.title,this.timeAgo,this.newsAbstract,this.commentNum,this.newsAttribute,this.newsShowType,this.picList,this.tagImgs,this.isH5,);

  factory NewsLists.fromJson(Map<String, dynamic> srcJson) => _$NewsListsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsListsToJson(this);

}


