import 'package:json_annotation/json_annotation.dart';

part 'new_list_des_model.g.dart';


@JsonSerializable()
class NewListDesModel extends Object {

  @JsonKey(name: 'error')
  int error;

  @JsonKey(name: 'code')
  String code;

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

  NewListDesModel(this.error,this.code,this.codeDesc,this.msg,this.isLogin,this.appId,this.data,);

  factory NewListDesModel.fromJson(Map<String, dynamic> srcJson) => _$NewListDesModelFromJson(srcJson);
  Map<String, dynamic> toJson() => _$NewListDesModelToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'authorUserId')
  String authorUserId;

  @JsonKey(name: 'authorNickName')
  String authorNickName;

  @JsonKey(name: 'authorIconUrl')
  String authorIconUrl;

  @JsonKey(name: 'authorJunxianLevel')
  String authorJunxianLevel;

  @JsonKey(name: 'articleDesc')
  String articleDesc;

  @JsonKey(name: 'vip')
  String vip;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'publishTime')
  dynamic publishTime;

  @JsonKey(name: 'laud')
  String laud;

  @JsonKey(name: 'stamp')
  String stamp;

  @JsonKey(name: 'flag')
  String flag;

  @JsonKey(name: 'openHeight')
  int openHeight;

  @JsonKey(name: 'shareUrl')
  String shareUrl;

  @JsonKey(name: 'shareUrl_share')
  String shareUrlShare;

  @JsonKey(name: 'shareUrl_wx')
  String shareUrlWx;

  @JsonKey(name: 'shareImg')
  String shareImg;

  @JsonKey(name: 'shareAbstract')
  String shareAbstract;

  @JsonKey(name: 'weixin_id')
  String weixinId;

  @JsonKey(name: 'app_channel')
  String appChannel;

  @JsonKey(name: 'typeid')
  String typeid;

  @JsonKey(name: 'imgUrl')
  String imgUrl;

  @JsonKey(name: 'webContent')
  String webContent;

  @JsonKey(name: 'imgs')
  List<Imgs> imgs;

  @JsonKey(name: 'newsCategoryId')
  String newsCategoryId;

  @JsonKey(name: 'aboutNews')
  List<AboutNews> aboutNews;

  @JsonKey(name: 'newsAttribute')
  String newsAttribute;

  @JsonKey(name: 'commentSum')
  dynamic commentSum;

  @JsonKey(name: 'follow')
  String follow;

  @JsonKey(name: 'ADConfig')
  ADConfig aDConfig;

  @JsonKey(name: 'report')
  List<Report> report;

  @JsonKey(name: 'unlike')
  List<Unlike> unlike;

  @JsonKey(name: 'reward_msg')
  List<String> rewardMsg;

  @JsonKey(name: 'rewardTime')
  String rewardTime;

  @JsonKey(name: 'h5_url')
  String h5Url;

  Data(this.authorUserId,this.authorNickName,this.authorIconUrl,this.authorJunxianLevel,this.articleDesc,this.vip,this.id,this.title,this.publishTime,this.laud,this.stamp,this.flag,this.openHeight,this.shareUrl,this.shareUrlShare,this.shareUrlWx,this.shareImg,this.shareAbstract,this.weixinId,this.appChannel,this.typeid,this.imgUrl,this.webContent,this.imgs,this.newsCategoryId,this.aboutNews,this.newsAttribute,this.commentSum,this.follow,this.aDConfig,this.report,this.unlike,this.rewardMsg,this.rewardTime,this.h5Url,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Imgs extends Object {

  @JsonKey(name: 'img')
  String img;

  @JsonKey(name: 'width')
  int width;

  @JsonKey(name: 'height')
  int height;

  Imgs(this.img,this.width,this.height,);

  factory Imgs.fromJson(Map<String, dynamic> srcJson) => _$ImgsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ImgsToJson(this);

}


@JsonSerializable()
class AboutNews extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'timeAgo')
  String timeAgo;

  @JsonKey(name: 'newsAbstract')
  String newsAbstract;

  @JsonKey(name: 'commentNum')
  String commentNum;

  @JsonKey(name: 'newsAttribute')
  String newsAttribute;

  @JsonKey(name: 'newsShowType')
  int newsShowType;

  @JsonKey(name: 'picList')
  List<String> picList;

  @JsonKey(name: 'tagImgs')
  List<dynamic> tagImgs;

  @JsonKey(name: 'is_h5')
  String isH5;

  AboutNews(this.id,this.title,this.timeAgo,this.newsAbstract,this.commentNum,this.newsAttribute,this.newsShowType,this.picList,this.tagImgs,this.isH5,);

  factory AboutNews.fromJson(Map<String, dynamic> srcJson) => _$AboutNewsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AboutNewsToJson(this);

}


@JsonSerializable()
class ADConfig extends Object {

  @JsonKey(name: 'singleAd')
  List<SingleAd> singleAd;

  @JsonKey(name: 'bannerAdList')
  List<dynamic> bannerAdList;

  @JsonKey(name: 'adNewsList')
  List<AdNewsList> adNewsList;

  ADConfig(this.singleAd,this.bannerAdList,this.adNewsList,);

  factory ADConfig.fromJson(Map<String, dynamic> srcJson) => _$ADConfigFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ADConfigToJson(this);

}


@JsonSerializable()
class SingleAd extends Object {

  @JsonKey(name: 'serialId')
  String serialId;

  @JsonKey(name: 'adPosition')
  String adPosition;

  @JsonKey(name: 'adId')
  String adId;

  @JsonKey(name: 'style')
  String style;

  @JsonKey(name: 'adType')
  String adType;

  SingleAd(this.serialId,this.adPosition,this.adId,this.style,this.adType,);

  factory SingleAd.fromJson(Map<String, dynamic> srcJson) => _$SingleAdFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SingleAdToJson(this);

}


@JsonSerializable()
class AdNewsList extends Object {

  @JsonKey(name: 'serialId')
  String serialId;

  @JsonKey(name: 'adPosition')
  String adPosition;

  @JsonKey(name: 'adId')
  String adId;

  @JsonKey(name: 'style')
  String style;

  @JsonKey(name: 'adType')
  String adType;

  AdNewsList(this.serialId,this.adPosition,this.adId,this.style,this.adType,);

  factory AdNewsList.fromJson(Map<String, dynamic> srcJson) => _$AdNewsListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AdNewsListToJson(this);

}


@JsonSerializable()
class Report extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'msg')
  String msg;

  Report(this.id,this.msg,);

  factory Report.fromJson(Map<String, dynamic> srcJson) => _$ReportFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ReportToJson(this);

}


@JsonSerializable()
class Unlike extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'msg')
  String msg;

  Unlike(this.id,this.msg,);

  factory Unlike.fromJson(Map<String, dynamic> srcJson) => _$UnlikeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UnlikeToJson(this);

}


