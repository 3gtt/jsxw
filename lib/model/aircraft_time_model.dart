import 'package:json_annotation/json_annotation.dart';

part 'aircraft_time_model.g.dart';


List<AircraftTimeModel> getAircraftTimeModelList(List<dynamic> list){
  List<AircraftTimeModel> result = [];
  list.forEach((item){
    result.add(AircraftTimeModel.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class AircraftTimeModel extends Object {

  @JsonKey(name: 'title')
  String title;

  AircraftTimeModel(this.title,);

  factory AircraftTimeModel.fromJson(Map<String, dynamic> srcJson) => _$AircraftTimeModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AircraftTimeModelToJson(this);

}


