import 'package:json_annotation/json_annotation.dart';
part 'skill_model.g.dart';

@JsonSerializable()
class SkillModel {
  int? skillId;
  int? elementalType;
  int? skillCategory;
  int? hitCount;
  int? cooldown;
  double? power;
  double? statPowerRatio;
  double? chance;
  int? referencedStatType;

  SkillModel({
    this.skillId,
    this.elementalType,
    this.skillCategory,
    this.hitCount,
    this.cooldown,
    this.power,
    this.statPowerRatio,
    this.chance,
    this.referencedStatType,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) =>
      _$SkillModelFromJson(json);
  Map<String, dynamic> toJson() => _$SkillModelToJson(this);

  String get referencedStatTypeDisplay {
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
    return types[referencedStatType!];
  }

  String get skillCategoryDisplay {
    var categories = [
      'NorAtk',
      'Bltk',
      'DAtk',
      'AreaAtk',
      'BuffRAtk',
      'Heal',
      'HPBuff',
      'AtkBuff',
      'Defense',
      'Critical',
      'Hit',
      'Speed',
      'DmgRed',
      'CriDmg',
      'Buff',
      'Debuff',
      'TickDmg',
    ];
    return categories[skillCategory!];
  }

  String get elementalTypeDisplay {
    var types = [
      'Normal',
      'Fire',
      'Water',
      'Land',
      'Wind',
    ];
    return types[elementalType!];
  }
}
