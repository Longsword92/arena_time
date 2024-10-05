import 'package:json_annotation/json_annotation.dart';
part 'stat_model.g.dart';

@JsonSerializable()
class StatModel {
  int? value;
  int? type;
  bool? additional;

  StatModel({this.value, this.type, this.additional});

  factory StatModel.fromJson(Map<String, dynamic> json) =>
      _$StatModelFromJson(json);
  Map<String, dynamic> toJson() => _$StatModelToJson(this);

  String get typeDisplay {
    var types = [
      'NONE',
      'HP',
      'ATK',
      'DEF',
      'CRI',
      'HIT',
      'SPD',
      'DRV',
      'DRR',
      'CDMG',
      'ArmorPenetration',
      'Thorn',
    ];
    return type! >= types.length ? "NF" : types[type!];
  }
}
