// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemProduct _$ItemProductFromJson(Map<String, dynamic> json) => ItemProduct(
      productId: json['productId'] as String?,
      sellerAgentAddress: json['sellerAgentAddress'] as String?,
      sellerAvatarAddress: json['sellerAvatarAddress'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toInt(),
      registeredBlockIndex: (json['registeredBlockIndex'] as num?)?.toInt(),
      exist: json['exist'] as bool?,
      legacy: json['legacy'] as bool?,
      itemId: (json['itemId'] as num?)?.toInt(),
      grade: (json['grade'] as num?)?.toInt(),
      itemType: (json['itemType'] as num?)?.toInt(),
      itemSubType: (json['itemSubType'] as num?)?.toInt(),
      elementalType: (json['elementalType'] as num?)?.toInt(),
      tradableId: json['tradableId'] as String?,
      setId: (json['setId'] as num?)?.toInt(),
      combatPoint: (json['combatPoint'] as num?)?.toInt(),
      level: (json['level'] as num?)?.toInt(),
      skillModels: (json['skillModels'] as List<dynamic>?)
          ?.map((e) => SkillModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      statModels: (json['statModels'] as List<dynamic>?)
          ?.map((e) => StatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      optionCountFromCombination:
          (json['optionCountFromCombination'] as num?)?.toInt(),
      unitPrice: (json['unitPrice'] as num?)?.toDouble(),
      crystal: (json['crystal'] as num?)?.toDouble(),
      crystalPerPrice: (json['crystalPerPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ItemProductToJson(ItemProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'sellerAgentAddress': instance.sellerAgentAddress,
      'sellerAvatarAddress': instance.sellerAvatarAddress,
      'price': instance.price,
      'quantity': instance.quantity,
      'registeredBlockIndex': instance.registeredBlockIndex,
      'exist': instance.exist,
      'legacy': instance.legacy,
      'itemId': instance.itemId,
      'grade': instance.grade,
      'itemType': instance.itemType,
      'itemSubType': instance.itemSubType,
      'elementalType': instance.elementalType,
      'tradableId': instance.tradableId,
      'setId': instance.setId,
      'combatPoint': instance.combatPoint,
      'level': instance.level,
      'skillModels': instance.skillModels,
      'statModels': instance.statModels,
      'optionCountFromCombination': instance.optionCountFromCombination,
      'unitPrice': instance.unitPrice,
      'crystal': instance.crystal,
      'crystalPerPrice': instance.crystalPerPrice,
    };
