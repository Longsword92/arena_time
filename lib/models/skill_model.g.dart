// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillModel _$SkillModelFromJson(Map<String, dynamic> json) => SkillModel(
      skillId: (json['skillId'] as num?)?.toInt(),
      elementalType: (json['elementalType'] as num?)?.toInt(),
      skillCategory: (json['skillCategory'] as num?)?.toInt(),
      hitCount: (json['hitCount'] as num?)?.toInt(),
      cooldown: (json['cooldown'] as num?)?.toInt(),
      power: (json['power'] as num?)?.toDouble(),
      statPowerRatio: (json['statPowerRatio'] as num?)?.toDouble(),
      chance: (json['chance'] as num?)?.toDouble(),
      referencedStatType: (json['referencedStatType'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SkillModelToJson(SkillModel instance) =>
    <String, dynamic>{
      'skillId': instance.skillId,
      'elementalType': instance.elementalType,
      'skillCategory': instance.skillCategory,
      'hitCount': instance.hitCount,
      'cooldown': instance.cooldown,
      'power': instance.power,
      'statPowerRatio': instance.statPowerRatio,
      'chance': instance.chance,
      'referencedStatType': instance.referencedStatType,
    };
