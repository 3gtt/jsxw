import 'package:json_annotation/json_annotation.dart';

part 'arsenal_model.g.dart';


List<ArsenalModel> getArsenalModelList(List<dynamic> list){
  List<ArsenalModel> result = [];
  for (var item in list) {
    result.add(ArsenalModel.fromJson(item));
  }
  return result;
}
@JsonSerializable()
class ArsenalModel extends Object {

  @JsonKey(name: 'cf_controller_param')
  Cf_controller_param cfControllerParam;

  @JsonKey(name: 'cf_controller_class')
  String cfControllerClass;

  @JsonKey(name: 'cf_controller_hidebottombar')
  bool cfControllerHidebottombar;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'img')
  String img;

  ArsenalModel(this.cfControllerParam,this.cfControllerClass,this.cfControllerHidebottombar,this.title,this.img,);

  factory ArsenalModel.fromJson(Map<String, dynamic> srcJson) => _$ArsenalModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArsenalModelToJson(this);

}


@JsonSerializable()
class Cf_controller_param extends Object {

  @JsonKey(name: 'maintype')
  String? maintype;
  @JsonKey(name: 'country')
  String? country;
  @JsonKey(name: 'fileName')
  String? fileName;

  @JsonKey(name: 'title')
  String title;

  Cf_controller_param(this.maintype,this.country,this.fileName,this.title,);

  factory Cf_controller_param.fromJson(Map<String, dynamic> srcJson) => _$Cf_controller_paramFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Cf_controller_paramToJson(this);

}


