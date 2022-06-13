// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_list_des_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewListDesModel _$NewListDesModelFromJson(Map<String, dynamic> json) =>
    NewListDesModel(
      json['error'] as int,
      json['code'] as String,
      json['code_desc'] as String,
      json['msg'] as String,
      json['is_login'] as int,
      json['app_id'] as int,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewListDesModelToJson(NewListDesModel instance) =>
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
      json['authorUserId'] as String,
      json['authorNickName'] as String,
      json['authorIconUrl'] as String,
      json['authorJunxianLevel'] as String,
      json['articleDesc'] as String,
      json['vip'] as String,
      json['id'] as String,
      json['title'] as String,
      json['publishTime'],
      json['laud'] as String,
      json['stamp'] as String,
      json['flag'] as String,
      json['openHeight'] as int,
      json['shareUrl'] as String,
      json['shareUrl_share'] as String,
      json['shareUrl_wx'] as String,
      json['shareImg'] as String,
      json['shareAbstract'] as String,
      json['weixin_id'] as String,
      json['app_channel'] as String,
      json['typeid'] as String,
      json['imgUrl'] as String,
      json['webContent'] as String,
      (json['imgs'] as List<dynamic>)
          .map((e) => Imgs.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['newsCategoryId'] as String,
      (json['aboutNews'] as List<dynamic>)
          .map((e) => AboutNews.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['newsAttribute'] as String,
      json['commentSum'],
      json['follow'] as String,
      ADConfig.fromJson(json['ADConfig'] as Map<String, dynamic>),
      (json['report'] as List<dynamic>)
          .map((e) => Report.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['unlike'] as List<dynamic>)
          .map((e) => Unlike.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['reward_msg'] as List<dynamic>).map((e) => e as String).toList(),
      json['rewardTime'] as String,
      json['h5_url'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'authorUserId': instance.authorUserId,
      'authorNickName': instance.authorNickName,
      'authorIconUrl': instance.authorIconUrl,
      'authorJunxianLevel': instance.authorJunxianLevel,
      'articleDesc': instance.articleDesc,
      'vip': instance.vip,
      'id': instance.id,
      'title': instance.title,
      'publishTime': instance.publishTime,
      'laud': instance.laud,
      'stamp': instance.stamp,
      'flag': instance.flag,
      'openHeight': instance.openHeight,
      'shareUrl': instance.shareUrl,
      'shareUrl_share': instance.shareUrlShare,
      'shareUrl_wx': instance.shareUrlWx,
      'shareImg': instance.shareImg,
      'shareAbstract': instance.shareAbstract,
      'weixin_id': instance.weixinId,
      'app_channel': instance.appChannel,
      'typeid': instance.typeid,
      'imgUrl': instance.imgUrl,
      'webContent': instance.webContent,
      'imgs': instance.imgs,
      'newsCategoryId': instance.newsCategoryId,
      'aboutNews': instance.aboutNews,
      'newsAttribute': instance.newsAttribute,
      'commentSum': instance.commentSum,
      'follow': instance.follow,
      'ADConfig': instance.aDConfig,
      'report': instance.report,
      'unlike': instance.unlike,
      'reward_msg': instance.rewardMsg,
      'rewardTime': instance.rewardTime,
      'h5_url': instance.h5Url,
    };

Imgs _$ImgsFromJson(Map<String, dynamic> json) => Imgs(
      json['img'] as String,
      json['width'] as int,
      json['height'] as int,
    );

Map<String, dynamic> _$ImgsToJson(Imgs instance) => <String, dynamic>{
      'img': instance.img,
      'width': instance.width,
      'height': instance.height,
    };

AboutNews _$AboutNewsFromJson(Map<String, dynamic> json) => AboutNews(
      json['id'] as String,
      json['title'] as String,
      json['timeAgo'] as String,
      json['newsAbstract'] as String,
      json['commentNum'] as String,
      json['newsAttribute'] as String,
      json['newsShowType'] as int,
      (json['picList'] as List<dynamic>).map((e) => e as String).toList(),
      json['tagImgs'] as List<dynamic>,
      json['is_h5'] as String,
    );

Map<String, dynamic> _$AboutNewsToJson(AboutNews instance) => <String, dynamic>{
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

ADConfig _$ADConfigFromJson(Map<String, dynamic> json) => ADConfig(
      (json['singleAd'] as List<dynamic>)
          .map((e) => SingleAd.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['bannerAdList'] as List<dynamic>,
      (json['adNewsList'] as List<dynamic>)
          .map((e) => AdNewsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ADConfigToJson(ADConfig instance) => <String, dynamic>{
      'singleAd': instance.singleAd,
      'bannerAdList': instance.bannerAdList,
      'adNewsList': instance.adNewsList,
    };

SingleAd _$SingleAdFromJson(Map<String, dynamic> json) => SingleAd(
      json['serialId'] as String,
      json['adPosition'] as String,
      json['adId'] as String,
      json['style'] as String,
      json['adType'] as String,
    );

Map<String, dynamic> _$SingleAdToJson(SingleAd instance) => <String, dynamic>{
      'serialId': instance.serialId,
      'adPosition': instance.adPosition,
      'adId': instance.adId,
      'style': instance.style,
      'adType': instance.adType,
    };

AdNewsList _$AdNewsListFromJson(Map<String, dynamic> json) => AdNewsList(
      json['serialId'] as String,
      json['adPosition'] as String,
      json['adId'] as String,
      json['style'] as String,
      json['adType'] as String,
    );

Map<String, dynamic> _$AdNewsListToJson(AdNewsList instance) =>
    <String, dynamic>{
      'serialId': instance.serialId,
      'adPosition': instance.adPosition,
      'adId': instance.adId,
      'style': instance.style,
      'adType': instance.adType,
    };

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      json['id'] as String,
      json['msg'] as String,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'id': instance.id,
      'msg': instance.msg,
    };

Unlike _$UnlikeFromJson(Map<String, dynamic> json) => Unlike(
      json['id'] as String,
      json['msg'] as String,
    );

Map<String, dynamic> _$UnlikeToJson(Unlike instance) => <String, dynamic>{
      'id': instance.id,
      'msg': instance.msg,
    };
