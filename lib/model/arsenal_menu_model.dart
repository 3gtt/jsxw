import 'package:json_annotation/json_annotation.dart';

part 'arsenal_menu_model.g.dart';


@JsonSerializable()
class ArsenalMenuModel extends Object {

  @JsonKey(name: 'other_country')
  List<Other_country> otherCountry;

  ArsenalMenuModel(this.otherCountry,);

  factory ArsenalMenuModel.fromJson(Map<String, dynamic> srcJson) => _$ArsenalMenuModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArsenalMenuModelToJson(this);

}


@JsonSerializable()
class Other_country extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'item')
  List<Item>? item;

  Other_country(this.title,this.item,);

  factory Other_country.fromJson(Map<String, dynamic> srcJson) => _$Other_countryFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Other_countryToJson(this);

}


@JsonSerializable()
class Item extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'key')
  String key;

  @JsonKey(name: 'value')
  String value;

  Item(this.title,this.key,this.value,);

  factory Item.fromJson(Map<String, dynamic> srcJson) => _$ItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

}


