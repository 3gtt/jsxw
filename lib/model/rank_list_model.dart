import 'package:json_annotation/json_annotation.dart';

part 'rank_list_model.g.dart';

@JsonSerializable()
class RankListModel extends Object {

  @JsonKey(name: 'cf_items')
  List<Cf_items> cfItems;

  RankListModel(this.cfItems,);

  factory RankListModel.fromJson(Map<String, dynamic> srcJson) => _$RankListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RankListModelToJson(this);

}


@JsonSerializable()
class Cf_items extends Object {

  @JsonKey(name: 'cf_accessorytype')
  int cfAccessorytype;

  @JsonKey(name: 'cf_controller_hidebottombar')
  bool cfControllerHidebottombar;

  @JsonKey(name: 'cf_controller_class')
  String cfControllerClass;

  @JsonKey(name: 'cf_controller_param')
  Cf_controller_param cfControllerParam;

  @JsonKey(name: 'cf_title')
  String cfTitle;

  @JsonKey(name: 'cf_icon')
  String cfIcon;

  Cf_items(this.cfAccessorytype,this.cfControllerHidebottombar,this.cfControllerClass,this.cfControllerParam,this.cfTitle,this.cfIcon,);

  factory Cf_items.fromJson(Map<String, dynamic> srcJson) => _$Cf_itemsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Cf_itemsToJson(this);

}


@JsonSerializable()
class Cf_controller_param extends Object {

  @JsonKey(name: 'maintype')
  String maintype;

  @JsonKey(name: 'title')
  String title;

  Cf_controller_param(this.maintype,this.title,);

  factory Cf_controller_param.fromJson(Map<String, dynamic> srcJson) => _$Cf_controller_paramFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Cf_controller_paramToJson(this);

}


