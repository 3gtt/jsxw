import 'package:json_annotation/json_annotation.dart';

part 'aircraft_model.g.dart';


@JsonSerializable()
class AircraftModel extends Object {

  @JsonKey(name: 'item')
  List<Item> item;

  AircraftModel(this.item);

  factory AircraftModel.fromJson(Map<String, dynamic> srcJson) => _$AircraftModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AircraftModelToJson(this);

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


