// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatModel _$StatModelFromJson(Map<String, dynamic> json) => StatModel(
      value: (json['value'] as num?)?.toInt(),
      type: (json['type'] as num?)?.toInt(),
      additional: json['additional'] as bool?,
    );

Map<String, dynamic> _$StatModelToJson(StatModel instance) => <String, dynamic>{
      'value': instance.value,
      'type': instance.type,
      'additional': instance.additional,
    };
